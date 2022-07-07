class Inquiry < ApplicationRecord
  attr_accessor :name, :email, :title, :phone_number, :body

  validates :name, presence: true,
  validates :email, presence: true,
  validates :body, presence: true,
end
