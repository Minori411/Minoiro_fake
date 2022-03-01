class Inquiry < ApplicationRecord
    attr_accessor :name, :email, :title, :phone_number, :body

  validates :name, :presence => {:message => '名前を入力してください'}
  validates :email, :presence => {:message => 'メールアドレスを入力してください'}
  validates :body, :presence => {:message => '本文を入力してください'}
end
