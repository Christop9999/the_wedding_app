class AddGuestIdToWedding < ActiveRecord::Migration
  def change
    add_column :weddings, :guest_id, :integer
    add_index :weddings, :guest_id
  end
  
end
