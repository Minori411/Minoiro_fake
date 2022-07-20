class SmallPlan < ApplicationRecord
  belongs_to :user

  validate :check_number_of_smallplans

 def check_number_of_smallplans
  if user && user.smallplans.count > 4
   errors.add(:user, "人数OVER")
  end
 end
end
