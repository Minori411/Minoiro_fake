class CreateReviews < ActiveRecord::Migration[7.0]
  def change
    create_table :reviews do |t|

      t.float :evaluation, null: false

      t.timestamps
    end
  end
end
