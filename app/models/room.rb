class Room < ApplicationRecord
  has_many :bookings, dependent: :destroy, primary_key: :booking_id, foreign_key: :booking_id

  validates :room_type, presence: true
  validates :room_number, presence: true
  validates :room_number, uniqueness: true

  enum room_type: {
    "Royal Room": "royal_room",
    "Deluxe Room": "deluxe_room",
    "Standard Room": "standard_room",
    "Suite Room": "suite_room",
    "Family Room": "family_room",
  }, _prefix: true
end
