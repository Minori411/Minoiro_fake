class AddNicknameToUsers < ActiveRecord::Migration[7.0]
  def change
    add_column :users, :nickname, :string
    add_column :users, :prefecture, :string
    add_column :users, :user_image, :string
    add_column :users, :userstyle, :integer
    add_column :users, :introduction, :text
    add_column :users, :total_users, :integer
    add_column :users, :deleted_at, :datetime
    add_column :users, :blogs, :text
    add_column :users, :select_bottles, :string
    add_column :users, :career, :text
    add_column :users, :url , :text
    add_column :users, :twitter, :string
    add_column :users, :facebook, :string
    add_column :users, :instagram, :string
    add_column :users, :certificate_name, :string
    add_column :users, :certificate, :string
    add_column :users, :disability_certificate, :string
    add_column :users, :level, :string
    add_column :users, :experience, :string
  end
end
