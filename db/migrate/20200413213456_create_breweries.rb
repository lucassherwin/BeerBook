class CreateBreweries < ActiveRecord::Migration[6.0]
  def change
    create_table :breweries do |t|
      t.string :name 
      t.string :street
      t.string :phone 
      t.integer :location_id
      t.string :website_url

      t.timestamps
    end
  end
end
