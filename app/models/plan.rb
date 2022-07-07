class Plan < ApplicationRecord
  belongs_to :user
  has_many :smallplans, dependent: :destroy
  accepts_nested_attributes_for :smallplans, allow_destroy: true

  # belongs_to :review

  def self.search(keyword)
    plan_ids = Plan.where([
                            "title like? OR body like?OR can_do like? OR status like? OR consent like?", "%#{keyword}%", "%#{keyword}%", "%#{keyword}%", "%#{keyword}%", "%#{keyword}%"
                          ]).ids
    smallplan_plan_ids = Smallplan.where(["plan_name like? OR plan_detail like? OR price like? OR video like? OR chat like?", "%#{keyword}%", "%#{keyword}%", "%#{keyword}%", "%#{keyword}%",
                                          "%#{keyword}%"]).pluck(:plan_id)
    user_ids = User.where(["name like OR career like?", "%#{keyword}%", "%#{keyword}%"]).ids
    review_ids = Review.where(["evaluation like?", "%#{keyword}%"]).ids
    user_plan_ids = Plan.where(user_id: user_ids).ids
    where(id: (plan_ids | smallplan_plan_ids | user_ids | review_ids))
  end
end
