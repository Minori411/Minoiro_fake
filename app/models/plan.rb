class Plan < ApplicationRecord
    belongs_to :user

    def self.search(keyword)
        where(["title like? OR body like?", "%#{keyword}%", "%#{keyword}%"])
    end
end
