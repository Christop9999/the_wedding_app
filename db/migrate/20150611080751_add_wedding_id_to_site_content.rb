class AddWeddingIdToSiteContent < ActiveRecord::Migration
  def change
    add_column :site_contents, :wedding_id, :integer
    add_index :site_contents, :wedding_id
  end
end
