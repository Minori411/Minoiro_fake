class Plan < ApplicationRecord
    belongs_to :user
    # belongs_to :review

    def self.search(keyword)
        where(["title like? OR body like?OR can_do like? OR status like? OR consent like? OR plan_name like? OR plan_detail like?","%#{keyword}%","%#{keyword}%", "%#{keyword}%","%#{keyword}%","%#{keyword}%", "%#{keyword}%", "%#{keyword}%"])
    end

   
end
