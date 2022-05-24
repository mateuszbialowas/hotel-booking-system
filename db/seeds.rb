# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: "Star Wars" }, { name: "Lord of the Rings" }])
#   Character.create(name: "Luke", movie: movies.first)

unless AdminUser.exists?
  AdminUser.create!(name: "mradmin", password: "mradmin")
  puts "Admin user created"
end

if Guest.count < 20
  20.times do
    Guest.create!(
      guest_name: FFaker::Name.name,
      guest_passport_no: Faker::Number.number(digits: 10),
      guest_phone: Faker::Number.number(digits: 10),
      )
  end
  puts "20 guests created"
end
