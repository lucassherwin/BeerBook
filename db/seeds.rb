require 'rest-client'
require 'json'

# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)
Beer.destroy_all
Location.destroy_all
Brewery.destroy_all
BeerCategory.destroy_all

#BeerCategories
unparsed_beerCategory_data = RestClient.get("https://data.opendatasoft.com/api/records/1.0/search/?dataset=open-beer-database%40public-us&facet=style_name&facet=cat_name&facet=name_breweries&facet=country")
parsed_beerCategory_data = JSON.parse(unparsed_beerCategory_data)

category = []
parsed_beerCategory_data['records'].each do |cat|
    category << cat['fields']['cat_name']
end
category.uniq.each do |cat|
    BeerCategory.create(category: cat)
end

#Beers
#name, abv, brewery_id, beer_category_id

unparsed_beer_data = RestClient.get("https://data.opendatasoft.com/api/records/1.0/search/?dataset=open-beer-database%40public-us&facet=style_name&facet=cat_name&facet=name_breweries&facet=country")
parsed_beer_data = JSON.parse(unparsed_beer_data)

parsed_beer_data['records'].each do |b|
    Location.create(city: b['fields']['city'], state: b['fields']['state'], country: b['fields']['country'])

    cat = BeerCategory.create(category: b['fields']['cat_name'])

    brew = Brewery.create(name: b['fields']['name_breweries'], street: b['fields']['address1'])

    beer = Beer.new(name: b['fields']['name'], abv: b['fields']['abv'])

    beer.brewery = brew
    beer.beer_category = cat
    beer.save
end