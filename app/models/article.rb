class Article < ApplicationRecord
    belongs_to :user
    # タグのリレーションのみ記載
    validates :subject, presence: true
    validates :body, presence: true 
end
