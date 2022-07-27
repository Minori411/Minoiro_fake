class Plan < ApplicationRecord
  MAX_PLANS_COUNT = 2
  belongs_to :user
  validate :plans_count_must_be_within_limit
  has_many :smallplans, dependent: :destroy
  accepts_nested_attributes_for :smallplans, allow_destroy: true

  # belongs_to :review

  def self.search(keyword, price, evaluation, chat, video)
    if keyword.present?
      plan_ids = Plan.where([
                              "title like? OR body like?OR can_do like? OR status like? OR consent like?", "%#{keyword}%", "%#{keyword}%", "%#{keyword}%", "%#{keyword}%", "%#{keyword}%"
                            ]).ids
      smallplan_plan_ids = Smallplan.where(["plan_name like? OR plan_detail like?", "%#{keyword}%", "%#{keyword}%"]).pluck(:plan_id)
      user_user_ids = User.where(["name like? OR prefecture like?", "%#{keyword}%", "%#{keyword}%"]).ids
    else
      plan_ids = []
      smallplan_plan_ids = []
      user_user_ids = []
    end

    smallplan = Smallplan.all
    smallplan = smallplan.where("price <= 2000") if price == "2"
    smallplan = smallplan.where("price <= 3000") if price == "3"
    smallplan = smallplan.where("price <= 4000") if price == "4"
    smallplan = smallplan.where("price <= 4999") if price == "5"

    smallplan = smallplan.where(chat: true) if chat == "1"
    smallplan = smallplan.where(video: true) if video == "1"

    reviews_ids = []
    reviews_ids = Review.having('AVG(evaluation) <= 3').group(:reviewee_id).average(:evaluation).keys if evaluation == "2"
    reviews_ids = Review.having('AVG(evaluation) <= 4').group(:reviewee_id).average(:evaluation).keys if evaluation == "3"
    reviews_ids = Review.having('AVG(evaluation) = 5').group(:reviewee_id).average(:evaluation).keys if evaluation == "4"

    # 2と3(★3以下と★4以下)の場合はレビューがないユーザーも対象とする
    if evaluation == "2" || evaluation == "3"
      reviews_ids += User.where.missing(:reviewees).pluck(:id)
    end

    user_ids = User.where(id: reviews_ids).ids
    users = Plan.where(user_id: user_ids).ids

    small_plan = smallplan.pluck(:plan_id) if smallplan.present?
    logger.warn("@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@")
    logger.warn(users)
    logger.warn(user_user_ids)
    logger.warn(small_plan)
    logger.warn(smallplan_plan_ids)
    logger.warn(plan_ids)
    logger.warn(users & user_user_ids & small_plan & smallplan_plan_ids & plan_ids)

    result_ids = Plan.all.pluck[:id]
    result_ids = result_ids & plan_ids if users.length > 0
    result_ids = result_ids & smallplan_plan_ids if users.length > 0
    result_ids = result_ids & user_user_ids  if users.length > 0
    result_ids = result_ids & small_plan if users.length > 0
    result_ids = result_ids & users if users.length > 0



    where(id: (result_ids))
  end

  private

  def plans_count_must_be_within_limit
    errors.add(:base, "plans count limit: #{MAX_PLANS_COUNT}") if user.plans.count >= MAX_PLANS_COUNT
  end
end
