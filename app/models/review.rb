class Review < ApplicationRecord
  belongs_to :user
  # has_many :plans, dependent: :destroy

  def avg_score
    unless self.reviews.empty?
      reviews.average(:evaluation).round(1)
    else
      0.0
    end
  end

 def avg_score_percentage
   unless self.reviews.empty?
     reviews.average(:evaluation).round(1).to_f*100/5
   else
     0.0
   end
 end
end
