class AddBrewerIdToLocations < ActiveRecord::Migration[6.0]
  def change
    add_column :locations, :brewery_id, :integer
  end
end
