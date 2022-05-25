class Guest < ApplicationRecord
  has_many :bookings, primary_key: :booking_id, foreign_key: :booking_id

  validates :guest_name, :guest_passport_no, :guest_phone, presence: true
  validates :guest_passport_no, :guest_phone, uniqueness: true
  validates :guest_passport_no, length: { in: 9..10 }
  validates :guest_passport_no, numericality: { only_integer: true }
  validates :guest_phone, length: { is: 10 }
  validates :guest_phone, numericality: { only_integer: true }

  before_save :convert_phone_number, :convert_passport_no

  private

  def convert_phone_number
    self.guest_phone = self.guest_phone.to_s.gsub(/\D/, '')
  end

  def convert_passport_no
    self.guest_passport_no = self.guest_passport_no.to_s.gsub(/\D/, '')
  end
end
