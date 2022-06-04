class AddVideoToPlans < ActiveRecord::Migration[7.0]
  def change
    add_column :plans, :video, :boolean, default: false, null: false
    add_column :plans, :chat, :boolean, default: false, null: false
    add_column :plans, :plan_name, :string
    add_column :plans, :plan_detail, :text
    add_column :plans, :price, :integer

  end
end
