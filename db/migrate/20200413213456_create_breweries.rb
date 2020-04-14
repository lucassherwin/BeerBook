class CreateBreweries < ActiveRecord::Migration[6.0]
  def change
    create_table :breweries do |t|
      t.integer :distribution_id
      t.string :name 
      t.string :street
      t.string :phone 
      t.string :website_url

      t.timestamps
    end
  end
end
