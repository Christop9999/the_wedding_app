class ChangeUserIdToGuestId < ActiveRecord::Migration
  def change
  	rename_column :wedding_guests, :user_id, :guest_id
  	
  end
  
end
