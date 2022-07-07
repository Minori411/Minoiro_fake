class AddNicknameToUsers < ActiveRecord::Migration[7.0]
  def change
    add_column :users, :prefecture, :string
    add_column :users, :userstyle, :integer, default: 0
    add_column :users, :is_kiyaku, :boolean, default: false, null: false
    add_column :users, :introduction, :text
    add_column :users, :total_users, :integer
    add_column :users, :deleted_at, :datetime
    add_column :users, :career, :text
    add_column :users, :url, :text
    add_column :users, :certificate_name, :string
    add_column :users, :certificate, :string
    add_column :users, :level, :string
    add_column :users, :experience, :string
    add_column :users, :disability_passport, :string
    add_column :users, :year, :datetime
  end
end
