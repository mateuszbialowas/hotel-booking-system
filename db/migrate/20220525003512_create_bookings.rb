class CreateBookings < ActiveRecord::Migration[7.0]
  def change
    create_table :bookings, primary_key: :booking_id do |t|
      t.datetime :start_date, null: false
      t.datetime :end_date, null: false
      t.belongs_to :room, null: false
      t.belongs_to :guest, null: false
    end
    add_foreign_key :bookings, :rooms, column: :room_id, primary_key: :room_id
    add_foreign_key :bookings, :guests, column: :guest_id, primary_key: :guest_id
  end
end