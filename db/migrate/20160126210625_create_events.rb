class CreateEvents < ActiveRecord::Migration
  def change
    create_table :events do |t|
      t.string :name
      t.integer :sanders_id
      t.string :url
      t.datetime :start
      t.text :description
      t.string :event_type

      t.timestamps null: false
    end
  end
end
