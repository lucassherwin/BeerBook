class AddCategoryToBeers < ActiveRecord::Migration[6.0]
  def change
    rename_column :beers, :category, :beer_category_id
  end
end
