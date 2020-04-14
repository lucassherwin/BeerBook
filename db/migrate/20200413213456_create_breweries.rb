class CreateBreweries < ActiveRecord::Migration[6.0]
  def change
    create_table :breweries do |t|
      t.string :name 
      t.string :street

      t.timestamps
    end
  end
end
