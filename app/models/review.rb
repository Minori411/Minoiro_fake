class Review < ApplicationRecord
  belongs_to :user
  # has_many :plans, dependent: :destroy

  def avg_score
    if reviews.empty?
      0.0
    else
      reviews.average(:evaluation).round(1)
    end
  end

  def avg_score_percentage
    if reviews.empty?
      0.0
    else
      reviews.average(:evaluation).round(1).to_f * 100 / 5
    end
  end
end
