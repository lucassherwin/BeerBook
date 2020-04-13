class CreateLocations < ActiveRecord::Migration[6.0]
  def change
    create_table :locations do |t|
      t.integer :brewery_id
      t.string :city
      t.string :state
      t.string :country
      t.timestamps
    end
  end
end
