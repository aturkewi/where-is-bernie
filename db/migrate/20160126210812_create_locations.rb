class CreateLocations < ActiveRecord::Migration
  def change
    create_table :locations do |t|
      t.integer :event_id
      t.string :name
      t.float :lat
      t.float :long
      t.string :address
      t.string :city
      t.string :state
      t.string :zip

      t.timestamps null: false
    end
  end
end
