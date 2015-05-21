class CreateWeddingGuests < ActiveRecord::Migration
  def up
    create_table :wedding_guests do |t|
      t.references :user
      t.references :wedding
      t.timestamps
    end
    add_index :wedding_guests, ["user_id", "wedding_id"]
  end

  def down
  	drop_table :wedding_guests
  end

end
