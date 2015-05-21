class AddAdminIdToWeddings < ActiveRecord::Migration
  def change
    add_column :weddings, :admin_id, :integer
    add_index :weddings, :admin_id
  end
end
