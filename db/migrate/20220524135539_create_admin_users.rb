class CreateAdminUsers < ActiveRecord::Migration[7.0]
  def change
    create_table :admin_users do |t|
      t.string :name, null: false
      t.string :password_digest, null: false
    end
  end
end
