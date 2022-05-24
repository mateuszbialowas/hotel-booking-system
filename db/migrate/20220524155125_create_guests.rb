class CreateGuests < ActiveRecord::Migration[7.0]
  def change
    create_table :guests, id: false do |t|
      t.integer :guest_id, null: false, primary_key: true, auto_increment: true
      t.string :guest_name, null: false
      t.string :guest_passport_no, null: false, unique: true
      t.string :guest_phone, null: false , unique: true
    end
  end
end
