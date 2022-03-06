class CreatePlans < ActiveRecord::Migration[7.0]
  def change
    create_table :plans do |t|
      t.string :title
      t.string :tag
      t.text :can_do
      t.string :youtube
      t.text :body
      t.string :status
      t.string :consent
      t.references :user, foreign_key: true

      t.timestamps
    end
  end
end
