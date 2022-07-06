class CreateReviews < ActiveRecord::Migration[7.0]
  def change
    create_table :reviews do |t|
      t.references :user, null: false, foreign_key: true
      t.text :body
      t.string :name
      t.integer :reviewer_id
      t.integer :reviewee_id
      t.float :evaluation, null: false

      t.timestamps
    end
  end
end
