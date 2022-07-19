class Plan < ApplicationRecord
  belongs_to :user
  has_many :smallplans, dependent: :destroy
  accepts_nested_attributes_for :smallplans, allow_destroy: true

  # belongs_to :review

  def self.search(keyword, price, evaluation, chat, video)
    if keyword
      plan_ids = Plan.where([
                              "title like? OR body like?OR can_do like? OR status like? OR consent like?", "%#{keyword}%", "%#{keyword}%", "%#{keyword}%", "%#{keyword}%", "%#{keyword}%"
                            ]).ids
      smallplan_plan_ids = Smallplan.where(["plan_name like? OR plan_detail like? OR price like?", "%#{keyword}%", "%#{keyword}%", "%#{keyword}%"]).pluck(:plan_id)
    else
      plan_ids = []
      smallplan_plan_ids = []
    end
    smallplan = Smallplan.all
    smallplan = smallplan.where("price <= 2000") if price == "2"
    smallplan = smallplan.where("price <= 3000") if price == "3"
    smallplan = smallplan.where("price <= 4000") if price == "4"
    smallplan = smallplan.where("price <= 4999") if price == "5"

    smallplan = smallplan.where(chat: true) if chat == "1"
    smallplan = smallplan.where(video: true) if video == "1"

    reviews = []
    reviews = Review.where("evaluation <= 3") if evaluation == "2"
    reviews = Review.where("evaluation <= 4") if evaluation == "3"
    reviews = Review.where("evaluation = 5") if evaluation == "4"
    reviewee_id = reviews.pluck(:reviewee_id)
    user_ids = User.where(id: reviewee_id).ids
    users= Plan.where(user_id: user_ids).ids
    


    # smallplan_plan_ids = Smallplan.where("price <= 2000")

    # user_ids = User.where(["name like? OR prefecture like?", "%#{keyword}%", "%#{keyword}%"]).ids
    
    # user_plan_ids = Plan.where(user_id: user_ids).ids

    small_plan = smallplan.pluck(:plan_id) if smallplan.present?
    logger.warn("@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@")
    logger.warn(smallplan_plan_ids)
    logger.warn(plan_ids)
    logger.warn(small_plan)
    puts hoge = ( small_plan|| smallplan_plan_ids  || plan_ids)

    where(id: ( small_plan || users || smallplan_plan_ids || plan_ids))
  end
end
