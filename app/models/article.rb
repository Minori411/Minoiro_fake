class Article < ApplicationRecord
    belongs_to :user
    # タグのリレーションのみ記載
    has_many :article_tags,dependent: :destroy
    has_many :tags,through: :article_tags

    def save_tags(article_tag)
            article_tag.each do |tag|
            new_tag = Tag.find_or_create_by(name: tag)
            self.tags << new_tag
        end
    end

    def save_tags(article_tag)
        current_tags = self.tags.pluck(:name) unless self.tags.nil?
        old_tags = current_tags - article_tag
        new_tags = article_tag - current_tags
    
        # 古いタグを削除
        old_tags.each do |old_tag|
            self.tags.delete(Tag.find_by(name: old_tag))
        end
    
        # 新しいタグを追加
        new_tags.each do |new_tag|
            add_tag = Tag.find_or_create_by(name: new_tag)
            self.tags << add_tag
        end
    end
end
