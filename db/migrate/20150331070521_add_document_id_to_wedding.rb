class AddDocumentIdToWedding < ActiveRecord::Migration
  def change
    add_column :weddings, :document_id, :integer
  end
end
