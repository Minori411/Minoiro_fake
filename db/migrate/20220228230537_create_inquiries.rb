class CreateInquiries < ActiveRecord::Migration[7.0]
  def change
    create_table :inquiries do |t|
      t.timestamps
      t.string :name
      t.string :email
      t.string :phone_number
      t.string :title
      t.text :body
    end
  end
end
