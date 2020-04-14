class RemoveDistributionIdFromBreweries < ActiveRecord::Migration[6.0]
  def change
    remove_column :breweries, :distribution_id, :integer
  end
end
