class Booking < ApplicationRecord
  belongs_to :room
  belongs_to :guest

  validates :start_date, :end_date, presence: true
end
