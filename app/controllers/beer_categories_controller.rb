class BeerCategoriesController < ApplicationController
    def show
        @category = BeerCategory.find(params[:id])
    end
end