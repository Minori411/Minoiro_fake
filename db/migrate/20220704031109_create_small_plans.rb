class CreateSmallPlans < ActiveRecord::Migration[7.0]
  def change
    create_table :small_plans do |t|
      t.timestamps
      t.boolean :video, default: false, null: false
      t.boolean :chat, default: false, null: false
      t.string :plan_name
      t.string :plan_detail
      t.integer :price
      t.references :plan, null: false, foreign_key: true
      t.references :user, null: false, foreign_key: true
    end
  end
end
