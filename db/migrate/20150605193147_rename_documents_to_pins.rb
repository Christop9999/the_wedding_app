class RenameDocumentsToPins < ActiveRecord::Migration
  def change
  	rename_table :documents, :pins
  	add_column :pins, :user_id, :integer
  	add_column :pins, :title, :string
  	add_column :pins, :description, :text
  	add_index :pins, :user_id
  end
end
