class CreateWeddings < ActiveRecord::Migration
  def up
    create_table :weddings do |t|
      t.string :name
      t.string :bride
      t.string :groom
      t.date :date

      t.timestamps
    end
  end

  def down
  	drop_table :weddings
  end
  
end
