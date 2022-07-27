class User < ApplicationRecord
  # validates_acceptance_of :is_kiyaku, allow_nil: false, on: :create
  has_many :articles, dependent: :destroy
  has_many :reviews, dependent: :destroy
  has_many :following_relationships, foreign_key: "follower_id", class_name: "Relationship",
                                     dependent: :destroy
  has_many :following, through: :following_relationships, dependent: :destroy
  has_many :follower_relationships, foreign_key: "following_id", class_name: "Relationship",
                                    dependent: :destroy
  has_many :followers, through: :follower_relationships, dependent: :destroy
  has_many :entries, dependent: :destroy
  has_many :messages, dependent: :destroy
  has_many :user_select_bottles, dependent: :destroy
  has_many :plans, dependent: :destroy
  has_many :reviewees, foreign_key: "reviewee_id", class_name: "Review", dependent: :destroy
  # validates :plans, numericality: { in: 1..2}
  has_many :contracts, dependent: :destroy
  has_many :customer_contracts, foreign_key: "customer_id", class_name: "Contract", dependent: :destroy
  has_many :smallplans, dependent: :destroy

  mount_uploader :image, ImageUploader
  mount_uploader :disability_passport, DisabilityUploader
  mount_uploader :certificate, CertificateUploader

  CUSTOMER = 0
  CONSULTANT = 1
  # NOTE: User.style で判別する場合 (数値で判別する場合)
  # メソッドを定義して、数値 (マジックナンバー) を秘匿するのが、読みやすくなるコードにつながる

  def consultant?
    userstyle.eql?(CONSULTANT)
  end

  def customer?
    userstyle.eql?(CUSTOMER)
  end

  def self.search(keyword)
    where(["title like? OR name like? OR body like?OR can_do like? OR status like? OR consent like? OR plan_name like? OR plan_detail like?", "%#{keyword}%", "%#{keyword}%", "%#{keyword}%",
           "%#{keyword}%", "%#{keyword}%", "%#{keyword}%", "%#{keyword}%", "%#{keyword}%"])

   
  end

  # フォローしているかを確認するメソッド
  def following?(user)
    following_relationships.find_by(following_id: user.id)
  end

  # フォローするときのメソッド
  def follow(user)
    following_relationships.create!(following_id: user.id)
  end

  # フォローを外すときのメソッド
  def unfollow(user)
    following_relationships.find_by(following_id: user.id).destroy
  end

  def followed_by?(user_id)
    following_relationships.exists?(following_id: user_id)
  end
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable,
         :confirmable,
         :trackable

  soft_deletable # <- kakurenbo-putiを使えるようにする

  # 論理削除に対応するため、validationをカスタマイズする
  validates :email, presence: true, length: { maximum: 255 }
  validates :email, format: { with: Devise.email_regexp, if: :will_save_change_to_email? }
  validates :password, presence: true, confirmation: true, length: { in: Devise.password_length },
                       on: :create
  validates :password, confirmation: true, length: { in: Devise.password_length },
                       allow_blank: true, on: :update

  # データベース認証時に使われるメソッドを上書きして、
  # without_soft_destroyedを追加する
  def self.find_for_database_authentication(warden_conditions)
    conditions = warden_conditions.dup
    without_soft_destroyed.where(conditions.to_h).first
  end

  def active_for_authentication?
    super && (is_deleted == false)
  end

  def self.guest
    find_or_create_by!(email: 'guest@example.com') do |user|
      user.password = SecureRandom.urlsafe_base64
      user.confirmed_at = Time.zone.now  # Confirmable を使用している場合は必要
    end
  end
end
