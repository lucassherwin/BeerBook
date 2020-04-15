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

#locations
#city
#state
#country
# unparsed_location_data = RestClient.get("https://api.openbrewerydb.org/breweries")
# parsed_location_data = JSON.parse(unparsed_location_data)


# parsed_location_data.each do |loc|
#     Location.create(city: loc['city'], state: loc['state'], country: loc['country'])
# end


# breweries
#name, street, phone, location_id, website_url
# unparsed_brewery_data = RestClient.get("https://api.openbrewerydb.org/breweries")
# parsed_brewery_data = JSON.parse(unparsed_brewery_data)

# parsed_brewery_data.each_with_index do |brew, i|
#     brewery = Brewery.new(name: brew['name'], street: brew['street'], phone: brew['phone'], website_url: brew['website_url'])
#     brewery.location_id = Location.all[i].id
#     brewery.save
# end

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

parsed_beer_data['records'].each_with_index do |b, i|
    Location.create(city: b['fields']['city'], state: b['fields']['state'], country: b['fields']['country'])

    brew = Brewery.create(name: b['fields']['name_breweries'], street: b['fields']['address1'])

    Beer.create(name: b['fields']['name'], abv: b['fields']['abv'], category: b['fields']['cat_name'], brewery_id: brew.id)
end

# parsed_beer_data['records'].each_with_index do |b, i|
#     beer =  Beer.new(name: b['fields']['name'], abv: b['fields']['abv'], category: b['fields']['cat_name'])
#     beer.brewery_id = Brewery.all[i].id
#     beer.save
# end


# #cities
# unparsed_city_data = RestClient.get("https://data.opendatasoft.com/api/records/1.0/search/?dataset=open-beer-database%40public-us&facet=style_name&facet=cat_name&facet=name_breweries&facet=country")
# parsed_data = JSON.parse(unparsed_data)
# # city = parsed_data["records"][0]["fields"]["city"]
# # puts city
# # Brewery.create(name: 'brewery')
# # Location.create(city: parsed_data["records"][0]["fields"]["city"], brewery: brewery1)

# city_names = []
# parsed_data["records"].each do |d|
#     city_names << d['fields']['city']
# end

# city_names
# puts city_names