class CreateTrips < ActiveRecord::Migration[5.2]
  def change
    create_table :trips do |t|
      t.datetime :trip_time
      t.string :location
      t.integer :trip_length
      t.string :boat_type
      t.float :price
      t.integer :passengers
      t.integer :user_id
      t.integer :client_id

      t.timestamps
    end
  end
end
