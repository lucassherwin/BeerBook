class DeleteDistribution < ActiveRecord::Migration[6.0]
  def change
    drop_table :distributions
  end
end
