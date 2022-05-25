class Booking < ApplicationRecord
  belongs_to :room
  belongs_to :guest

  validates :start_date, :end_date, presence: true
  validate :start_date_later_than_end_date,
           :check_start_date_later_than_today,
           :check_end_date_later_than_today,
           :check_booking_overlapping

  private

  def start_date_later_than_end_date
    if self.start_date.present? && self.end_date.present?
      if self.start_date >= self.end_date
        errors.add(:base, "Start date must be before end date")
      end
    end
  end

  def check_start_date_later_than_today
    if self.start_date.present? && self.end_date.present?
      if self.start_date < Date.today
        errors.add(:base, "Start date must be after today")
      end
    end
  end

  def check_end_date_later_than_today
    if self.start_date.present? && self.end_date.present?
      if self.end_date < Date.today
        errors.add(:base, "End date must be after today")
      end
    end
  end

  def check_booking_overlapping
    if self.start_date.present? && self.end_date.present?
      if Booking.where.not(booking_id: self.booking_id)
                .where(room_id: self.room_id)
                .where("start_date <= ? AND end_date >= ?", self.end_date, self.start_date).present?
        errors.add(:base, "Booking overlaps with another booking")
      end
    end
  end
end
