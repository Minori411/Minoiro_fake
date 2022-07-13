class Plan < ApplicationRecord
  belongs_to :user
  has_many :smallplans, dependent: :destroy
  accepts_nested_attributes_for :smallplans, allow_destroy: true

  # belongs_to :review

  def self.search(keyword, price)
    if keyword
      plan_ids = Plan.where([
                              "title like? OR body like?OR can_do like? OR status like? OR consent like?", "%#{keyword}%", "%#{keyword}%", "%#{keyword}%", "%#{keyword}%", "%#{keyword}%"
                            ]).ids
      smallplan_plan_ids = Smallplan.where(["plan_name like? OR plan_detail like? OR price like? OR video like? OR chat like?", "%#{keyword}%", "%#{keyword}%", "%#{keyword}%", "%#{keyword}%", "%#{keyword}%"]).pluck(:plan_id)
    else
      plan_ids = []
      smallplan_plan_ids = []
    end
    smallplan = []
    smallplan = Smallplan.where("price <= 2000") if price == "2"

    smallplan = Smallplan.where("price <= 3000") if price == "3"

    smallplan = Smallplan.where("price <= 4000") if price == "4"

    smallplan = Smallplan.where("price <= 4999") if price == "5"
    # smallplan_plan_ids = Smallplan.where("price <= 2000")

    # user_ids = User.where(["name like? OR prefecture like?", "%#{keyword}%", "%#{keyword}%"]).ids
    review_ids = Review.where(["evaluation like?", "%#{keyword}%"]).ids
    # user_plan_ids = Plan.where(user_id: user_ids).ids

    small_plan = smallplan.pluck(:plan_id) if smallplan.present?
    logger.warn("@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@")
    logger.warn(review_ids)
    logger.warn(smallplan_plan_ids)
    logger.warn(plan_ids)
    logger.warn(small_plan)

    where(id: (plan_ids | small_plan | review_ids | smallplan_plan_ids))
  end
end
