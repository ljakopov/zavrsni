class CreateUsers < ActiveRecord::Migration[5.0]
  def change
    create_table :users do |t|
      t.string "first_name"
      t.string "last_name"
      t.string "image"
      t.string "username"
      t.string "password"
      t.string "email"
      t.boolean "activate", :default => false
      t.boolean "admin", :default => false
      t.timestamps
    end
  end
end
