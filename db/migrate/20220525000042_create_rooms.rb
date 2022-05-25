class CreateRooms < ActiveRecord::Migration[7.0]
  def change
    create_table :rooms, id: false do |t|
      t.integer :room_id, null: false, primary_key: true
      t.integer :room_number, null: false, default: 1, unique: true
      t.string :room_type, null: false, default: 'standard_room'
    end
  end
end
