class MakeBeerCategoryInteger < ActiveRecord::Migration[6.0]
  def change
    change_column :beers, :beer_category_id, :integer
  end
end
