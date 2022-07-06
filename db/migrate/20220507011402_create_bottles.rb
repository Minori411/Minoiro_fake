class CreateBottles < ActiveRecord::Migration[7.0]
  def change
    create_table :bottles do |t|
      t.string :bottle_type
      t.string :bottle_name
      t.text :meaning_detail

      t.timestamps
    end
  end
end
