class Booking < ApplicationRecord
  belongs_to :room, primary_key: :room_id, foreign_key: :room_id
  belongs_to :guest, primary_key: :guest_id, foreign_key: :guest_id
end
