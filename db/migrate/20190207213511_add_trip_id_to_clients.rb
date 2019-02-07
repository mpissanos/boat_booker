class AddTripIdToClients < ActiveRecord::Migration[5.2]
  def change
    add_column :clients, :trip_id, :integer
  end
end
