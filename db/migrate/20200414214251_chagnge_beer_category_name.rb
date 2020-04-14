class ChagngeBeerCategoryName < ActiveRecord::Migration[6.0]
  def change
    rename_column :beers, :category_id, :beer_category_id
  end
end
