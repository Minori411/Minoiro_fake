class Relationship < ApplicationRecord
  # 自分をフォローしているユーザー
  belongs_to :follower, class_name: "User"
  # 自分がフォローしているユーザー
  belongs_to :following, class_name: "User"
  # バリデーション
end
