class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
          :recoverable, :rememberable,#validatable
          :confirmable
          
  soft_deletable # <- kakurenbo-putiを使えるようにする

  _validators.delete(:email)
  _validate_callbacks.each do |callback|
    if callback.filter.respond_to? :attributes
      callback.filter.attributes.delete :email
    end
  end
  

  # 論理削除に対応するため、validationをカスタマイズする
  validates :email, presence: true, length: { maximum: 255 }
  validates_format_of :email, with: Devise.email_regexp, if: :will_save_change_to_email?
  validates :password, presence: true, confirmation: true, length: { in: Devise.password_length }, on: :create
  validates :password, confirmation: true, length: { in: Devise.password_length }, allow_blank: true, on: :update

  # データベース認証時に使われるメソッドを上書きして、
  # without_soft_destroyedを追加する
  def self.find_for_database_authentication(warden_conditions)
    conditions = warden_conditions.dup
    self.without_soft_destroyed.where(conditions.to_h).first
  end

  def active_for_authentication?
    super && (is_deleted == false)
  end

end
