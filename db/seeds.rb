# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: "Star Wars" }, { name: "Lord of the Rings" }])
#   Character.create(name: "Luke", movie: movies.first)

unless AdminUser.exists?
  AdminUser.create!(name: 'mradmin', password: 'mradmin')
  puts 'Admin user created'
end

if Guest.count < 20
  20.times do
    Guest.create!(
      guest_name: FFaker::Name.name,
      guest_passport_no: Faker::Number.number(digits: 10),
      guest_phone: Faker::Number.number(digits: 10)
    )
  end
  puts '20 guests created'
end

if Room.count < 10
  10.times do
    Room.create!(
      room_type: %w[royal_room deluxe_room standard_room suite_room family_room].sample,
      room_number: Faker::Number.number(digits: 3)
    )
  end
  puts '10 rooms created'
end

if Booking.count < 10
  10.times do
    Booking.create(
      room_id: Room.all.sample.room_id,
      guest_id: Guest.all.sample.guest_id,
      start_date: Faker::Date.between(from: Date.today, to: Date.today + 30),
      end_date: Faker::Date.between(from: Date.today + 30, to: Date.today + 90)
    )
  end
  puts '10 bookings created'
end
