class CreateUserBreweries < ActiveRecord::Migration[6.0]
  def change
    create_table :user_breweries do |t|
      t.integer :user_id
      t.integer :brewery_id
      t.timestamps
    end
  end
end
