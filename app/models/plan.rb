class Plan < ApplicationRecord
  MAX_PLANS_COUNT = 2
  belongs_to :user
  validate :plans_count_must_be_within_limit
  has_many :smallplans, dependent: :destroy
  accepts_nested_attributes_for :smallplans, allow_destroy: true

  # belongs_to :review

  def self.search(keyword, price, evaluation)
    if keyword.present?
      plan_ids = Plan.where([
                              "title like? OR body like?OR can_do like? OR status like? OR consent like?", "%#{keyword}%", "%#{keyword}%", "%#{keyword}%", "%#{keyword}%", "%#{keyword}%"
                            ]).ids
      smallplan_plan_ids = Smallplan.where(["plan_name like? OR plan_detail like? OR price like? OR video like? OR chat like?", "%#{keyword}%", "%#{keyword}%", "%#{keyword}%", "%#{keyword}%", "%#{keyword}%"]).pluck(:plan_id)
      user_user_ids = User.where(["name like? OR prefecture like?", "%#{keyword}%", "%#{keyword}%"]).ids
    else
      plan_ids = []
      smallplan_plan_ids = []
      user_user_ids = []
    end
    smallplan = []
    smallplan = Smallplan.where("price <= 2000") if price == "2"

    smallplan = Smallplan.where("price <= 3000") if price == "3"

    smallplan = Smallplan.where("price <= 4000") if price == "4"

    smallplan = Smallplan.where("price <= 4999") if price == "5"

    reviews = []
    reviews = Review.where("evaluation <= 3") if evaluation == "2"

    reviews = Review.where("evaluation <= 4") if evaluation == "3"

    reviews = Review.where("evaluation = 5") if evaluation == "4"

    reviewee_id = reviews.pluck(:reviewee_id)
    user_ids = User.where(id: reviewee_id).ids
    users = Plan.where(user_id: user_ids).ids

    small_plan = smallplan.pluck(:plan_id) if smallplan.present?
    logger.warn("@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@")
    logger.warn(smallplan_plan_ids)
    logger.warn(plan_ids)
    logger.warn(small_plan)

    where(id: (users || user_user_ids || small_plan || smallplan_plan_ids || plan_ids))
  end

  private

  def plans_count_must_be_within_limit
    errors.add(:base, "plans count limit: #{MAX_PLANS_COUNT}") if user.plans.count >= MAX_PLANS_COUNT
  end
end
