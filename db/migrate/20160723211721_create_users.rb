class CreateUsers < ActiveRecord::Migration[5.0]
  def change
    create_table :users do |t|
      t.string "first_name"
      t.string "last_name"
      t.string "image"
      t.string "username"
      t.string "password"
      t.boolean "activate", :default => true
      t.boolean "admin", :default => false
      t.boolean "private", :default => true
      t.timestamps
    end
  end
end
