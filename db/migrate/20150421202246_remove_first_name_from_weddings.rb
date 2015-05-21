class RemoveFirstNameFromWeddings < ActiveRecord::Migration
  def change
    remove_column :weddings, :first_name, :string
    remove_column :weddings, :last_name, :string
  end
end
