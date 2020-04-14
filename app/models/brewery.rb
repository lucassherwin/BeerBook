class Brewery < ApplicationRecord
  belongs_to :distribution
  has_many :locations
end
