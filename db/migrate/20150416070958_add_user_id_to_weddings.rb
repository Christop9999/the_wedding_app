class AddUserIdToWeddings < ActiveRecord::Migration
  def change
  	add_column :weddings, :user_id, :integer
  	add_index :weddings, :user_id
  	
  end
end
