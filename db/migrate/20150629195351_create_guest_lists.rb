class CreateGuestLists < ActiveRecord::Migration
  def change
    create_table :guest_lists do |t|
      
      t.references :wedding, index: true
	  t.string :email
      t.string :first_name
      t.string :last_name
      t.boolean :attending
      t.integer :invited
      t.boolean :registered
      t.boolean :thank_you
      t.timestamps
      t.timestamps
    end
  end
end
