class AddPasswordDigestToUsers < ActiveRecord::Migration[5.2]
  def change
    add_column :users, :admin, :boolean, default: false
    add_column :users, :password_digest, :string, null: false, default: ''
  end
end
