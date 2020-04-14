class CreateUserComments < ActiveRecord::Migration[6.0]
  def change
    create_table :user_comments do |t|
      t.string :comment
      t.integer :user_id
      t.integer :beer_id
      t.timestamps
    end
  end
end
