class CreateVenues < ActiveRecord::Migration
  def up
    create_table :venues do |t|
      t.references :wedding, index: true
      t.string :name
      t.string :description
      t.string :street
      t.string :city
      t.string :zip
      t.string :state
      t.string :url

      t.timestamps
    end
  end

  def down
    drop_table :venues
  end

end
