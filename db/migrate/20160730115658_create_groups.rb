class CreateGroups < ActiveRecord::Migration[5.0]
  def change
    create_table :groups do |t|
      t.string :title
      t.string :description
      t.integer :user_id
      t.timestamps
    end
    add_index("groups", "user_id")
  end
end
