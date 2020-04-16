require 'rest-client'
require 'json'

class BreweriesController < ApplicationController

  def index 
    @breweries = Brewery.all 
  end

  def show 
    @brewery = Brewery.find(params[:id])
    brew_name = @brewery.name
    name = brew_name.gsub(" ", "+")
    unparsed_brew_data = RestClient.get("https://data.opendatasoft.com/api/records/1.0/search/?dataset=open-beer-database%40public-us&facet=style_name&facet=cat_name&facet=name_breweries&facet=country&refine.name_breweries=#{name}")
    parsed_brew_data = JSON.parse(unparsed_brew_data)
    
    @website = parsed_brew_data['records'][0]['fields']['website']

    @beer_name = []
    @beer_desc = []
    parsed_brew_data['records'].each do |b|
      @beer_name << b['fields']['name']
      @beer_desc << b['fields']['descript']
    end
    # byebug
  end
end
