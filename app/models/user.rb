class User < ApplicationRecord
  has_secure_password

  has_many :user_breweries 
  has_many :breweries, through: :user_breweries

  has_many :user_beers
  has_many :beers, through: :user_beers

  has_many :user_comments 
#   has_many :beers, through: :user_comments 
end
