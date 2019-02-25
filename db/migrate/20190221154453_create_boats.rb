class CreateBoats < ActiveRecord::Migration[5.2]
  def change
    create_table :boats do |t|
      t.string :boat_type
      t.string :name
      t.integer :capacity
      t.integer :user_id
      
     

      t.timestamps
    end
  end
end
