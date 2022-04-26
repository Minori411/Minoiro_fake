class CreateReviews < ActiveRecord::Migration[7.0]
  def change
    create_table :reviews do |t|

      t.float :evaluation, null: false
      t.integer :reviewer_id
      t.integer :reviewee_id
      t.text :body

      t.timestamps
    end
  end
end
