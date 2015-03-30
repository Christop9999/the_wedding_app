class CreateDocuments < ActiveRecord::Migration
  def change
    create_table :documents do |t|
      t.integer :wedding_id
      t.timestamps
    end

    add_index :documents, :wedding_id
    add_attachment :documents, :attachment
    
  end
end
