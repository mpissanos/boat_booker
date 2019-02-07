class RemoveClientIdFromTrips < ActiveRecord::Migration[5.2]
  def change
    remove_column :trips, :client_id
  end
end
