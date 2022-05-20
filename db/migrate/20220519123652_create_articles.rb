class CreateArticles < ActiveRecord::Migration[7.0]
  def change
    create_table :articles do |t|
      t.references :user, foreign_key: true
      t.string :subject
      t.text :body

      t.timestamps
    end
  end
end
