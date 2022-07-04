class Plan < ApplicationRecord
    belongs_to :user
    # belongs_to :review

    def self.search(keyword)
        plan_ids = Plan.where(["title like? OR price like? OR body like?OR can_do like? OR status like? OR consent like? OR plan_name like? OR plan_detail like?","%#{keyword}%","%#{keyword}%","%#{keyword}%", "%#{keyword}%","%#{keyword}%","%#{keyword}%", "%#{keyword}%", "%#{keyword}%"]).ids
        user_ids = User.where(["name like?","%#{keyword}%"]).ids
        user_plan_ids = Plan.where(user_id: user_ids).ids
        where(id: (plan_ids + user_ids).uniq)
    end

   
end
