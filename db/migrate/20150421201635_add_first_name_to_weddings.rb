class AddFirstNameToWeddings < ActiveRecord::Migration
  def change
    add_column :weddings, :first_name, :string
    add_column :weddings, :last_name, :string
  end
end
