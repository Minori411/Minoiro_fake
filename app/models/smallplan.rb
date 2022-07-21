class Smallplan < ApplicationRecord
  belongs_to :user
  belongs_to :plan, optional: true
  MAX_SMALLPLANS_COUNT = 3
  validate :smallplans_count_must_be_within_limit

  private

  def smallplans_count_must_be_within_limit
    errors.add(:base, "smallplans count limit: #{MAX_SMALLPLANS_COUNT}") if plan.smallplans.count >= MAX_SMALLPLANS_COUNT
  end
end
