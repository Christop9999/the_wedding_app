class AddWeddingIdToUser < ActiveRecord::Migration
  def change
    add_column :users, :wedding_id, :integer
    add_index :users, :wedding_id
  end
end
