class UserSelectBottle < ApplicationRecord
  belongs_to :user
  belongs_to :bottle
end
