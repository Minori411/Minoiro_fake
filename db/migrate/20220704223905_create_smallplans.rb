class CreateSmallplans < ActiveRecord::Migration[7.0]
  def change
    create_table :smallplans do |t|
      t.timestamps
      t.integer :price
      t.text :plan_detail
      t.string :plan_name
      t.boolean :video, default: false, null: false
      t.boolean :chat, default: false, null: false
      t.references :user, null: false, foreign_key: true
      t.references :plan, null: false, foreign_key: true
    end
  end
end
