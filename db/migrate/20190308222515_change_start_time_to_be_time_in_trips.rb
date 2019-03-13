class ChangeStartTimeToBeTimeInTrips < ActiveRecord::Migration[5.2]
  def change
    change_column :trips, :start_time, :time
  end
end
