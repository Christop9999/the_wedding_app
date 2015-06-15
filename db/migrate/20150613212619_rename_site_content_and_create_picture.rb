class RenameSiteContentAndCreatePicture < ActiveRecord::Migration
  def change
  	rename_table :site_contents, :galleries
  	

  	create_table :pictures do |t|
      t.string :description
      t.string :image
      t.integer :gallery_id
      t.string :gallery_token
      t.timestamps
    end
  end
end
