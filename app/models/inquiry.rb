class Inquiry < ApplicationRecord
  attr_accessor :name, :email, :title, :phone_number, :body

  validates :name
  validates :email
  validates :body
end
