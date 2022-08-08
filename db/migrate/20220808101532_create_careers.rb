class CreateCareers < ActiveRecord::Migration[7.0]
  def change
    create_table :careers do |t|
      t.datetime :started_at
      t.datetime :end_at
      t.string :content
      t.references :user, null: false, foreign_key: true
      t.timestamps
    end
  end
end
