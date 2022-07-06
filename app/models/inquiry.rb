class Inquiry < ApplicationRecord
  attr_accessor :name, :email, :title, :phone_number, :body

  validates :name, :presence
  validates :email, :presence
  validates :body, :presence
end
