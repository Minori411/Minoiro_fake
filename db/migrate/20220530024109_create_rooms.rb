class CreateRooms < ActiveRecord::Migration[7.0]
  def change
    create_table :rooms, &:timestamps
  end
end
