class Booking < ApplicationRecord
  self.primary_key = :booking_id
  belongs_to :room, foreign_key: :room_id
  belongs_to :guest, foreign_key: :guest_id
end
