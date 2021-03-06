# This file is auto-generated from the current state of the database. Instead
# of editing this file, please use the migrations feature of Active Record to
# incrementally modify your database, and then regenerate this schema definition.
#
# This file is the source Rails uses to define your schema when running `bin/rails
# db:schema:load`. When creating a new database, `bin/rails db:schema:load` tends to
# be faster and is potentially less error prone than running all of your
# migrations from scratch. Old migrations may fail to apply correctly if those
# migrations use external dependencies or application code.
#
# It's strongly recommended that you check this file into your version control system.

ActiveRecord::Schema[7.0].define(version: 2022_05_25_003512) do
  create_table "admin_users", force: :cascade do |t|
    t.string "name", null: false
    t.string "password_digest", null: false
  end

  create_table "bookings", primary_key: "booking_id", force: :cascade do |t|
    t.datetime "start_date", null: false
    t.datetime "end_date", null: false
    t.integer "room_id", null: false
    t.integer "guest_id", null: false
    t.index ["guest_id"], name: "index_bookings_on_guest_id"
    t.index ["room_id"], name: "index_bookings_on_room_id"
  end

  create_table "guests", primary_key: "guest_id", force: :cascade do |t|
    t.string "guest_name", null: false
    t.string "guest_passport_no", null: false
    t.string "guest_phone", null: false
  end

  create_table "rooms", primary_key: "room_id", force: :cascade do |t|
    t.integer "room_number", default: 1, null: false
    t.string "room_type", default: "standard_room", null: false
  end

  add_foreign_key "bookings", "guests", primary_key: "guest_id"
  add_foreign_key "bookings", "rooms", primary_key: "room_id"
end
