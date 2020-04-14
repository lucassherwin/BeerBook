class CreateDistributions < ActiveRecord::Migration[6.0]
  def change
    create_table :distributions do |t|
      t.string :brewery_type

      t.timestamps
    end
  end
end
