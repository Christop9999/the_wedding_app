class EditGalleries < ActiveRecord::Migration
  def change
  	remove_column :galleries, :picture_file_size
  	remove_column :galleries, :picture_updated_at
  	remove_column :galleries, :picture_content_type
  	add_column :galleries, :name, :string
  	add_column :galleries, :description, :string
  	add_column :galleries, :cover, :integer
  	add_column :galleries, :token, :string
  end
end
