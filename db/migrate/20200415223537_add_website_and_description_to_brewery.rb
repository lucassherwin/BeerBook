class AddWebsiteAndDescriptionToBrewery < ActiveRecord::Migration[6.0]
  def change
    add_column :breweries, :website, :string
    add_column :breweries, :description, :text
  end
end
