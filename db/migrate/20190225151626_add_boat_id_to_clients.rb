class AddBoatIdToClients < ActiveRecord::Migration[5.2]
  def change
    add_column :clients, :boat_id, :integer
  end
end
