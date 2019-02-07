class AddEndTimeToTrips < ActiveRecord::Migration[5.2]
  def change
    add_column :trips, :end_time, :date_time
  end
end
