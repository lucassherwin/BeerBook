class CreateBeers < ActiveRecord::Migration[6.0]
  def change
    create_table :beers do |t|
      t.string :name
      t.string :style
      t.integer :abv 
      t.integer :brewery_id
      t.integer :category_id

      t.timestamps
    end
  end
end
