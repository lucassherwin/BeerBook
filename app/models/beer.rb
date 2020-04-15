class Beer < ApplicationRecord
  has_many :user_beers
  has_many :users, through: :user_beers

  has_many :user_comments 
  has_many :beer_categories

  belongs_to :brewery
  # belongs_to :beer_category
end
