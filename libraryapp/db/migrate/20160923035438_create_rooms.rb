class CreateRooms < ActiveRecord::Migration[5.0]
  def change
    create_table :rooms do |t|
      t.integer :room_id
      t.integer :building
      t.integer :size

      t.timestamps
    end
  end
end
