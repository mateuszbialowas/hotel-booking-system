class CreateBookings < ActiveRecord::Migration[7.0]
  def change
    create_table :bookings, primary_key: :booking_id do |t|
      t.datetime :start_date, null: false
      t.datetime :end_date, null: false
      t.belongs_to :room, foreign_key: true, null: false
      t.belongs_to :guest, foreign_key: true, null: false
    end
  end
end
