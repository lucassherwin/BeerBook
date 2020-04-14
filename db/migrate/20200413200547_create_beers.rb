class CreateBeers < ActiveRecord::Migration[6.0]
  def change
    create_table :beers do |t|
      t.string :name
      t.integer :abv 
      t.integer :brewery_id
      t.string :category

      t.timestamps
    end
  end
end
