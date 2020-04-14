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

brewery1 = Brewery.create(name: "my brewery")
beer1 = Beer.create(name: 'beer1', beer_category: 'ale', )


# 10.times do
#     Beer.create(name: 'my beer', abv: rand(1..10))
# end

# unparsed_data = RestClient.get("https://data.opendatasoft.com/api/records/1.0/search/?dataset=open-beer-database%40public-us&facet=style_name&facet=cat_name&facet=name_breweries&facet=country")
# parsed_data = JSON.parse(unparsed_data)
# city = parsed_data["records"][0]["fields"]["city"]
# # puts city
# Brewery.create(name: 'brewery')
# Location.create(city: parsed_data["records"][0]["fields"]["city"], brewery_id: 1)