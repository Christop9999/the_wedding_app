class AddGuestIdToUsers < ActiveRecord::Migration
  def change
    add_column :users, :guest_id, :integer
    add_index :users, :guest_id
  end
end
