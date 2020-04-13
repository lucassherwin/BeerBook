class CreateUserBeers < ActiveRecord::Migration[6.0]
  def change
    create_table :user_beers do |t|

      t.timestamps
    end
  end
end
