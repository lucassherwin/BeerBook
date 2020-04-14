class AddAttributesToBeerCategory < ActiveRecord::Migration[6.0]
  def change
    add_column :beer_categories, :category, :string
  end
end
