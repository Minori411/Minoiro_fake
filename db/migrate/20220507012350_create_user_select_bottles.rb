class CreateUserSelectBottles < ActiveRecord::Migration[7.0]
  def change
    create_table :user_select_bottles do |t|
      t.references :user, null: false, foreign_key: true
      t.references :bottle, null: false, foreign_key: true

      t.timestamps
    end
  end
end
