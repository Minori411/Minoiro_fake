class Plan < ApplicationRecord
    belongs_to :user
    # belongs_to :review

    def self.search(keyword)
        where(["title like? OR body like?", "%#{keyword}%", "%#{keyword}%"])
    end

   
end
