class BeerCategoriesController < ApplicationController
    def show
        @beer_category = BeerCategory.find(params[:id])
    end
end


#ignore this comment