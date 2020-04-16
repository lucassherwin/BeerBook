class BeersController < ApplicationController
    before_action :find_beer, only: [:show]

    def index
        @beers = Beer.all
    end

    def show
        #find
    end

    def search
        @beer= Beer.find(params[:beer][:id])
    
        redirect_to @beer
    end
    
    def destroy
    end

    private

    def find_beer
        @beer = Beer.find(params[:id])
    end

    def beer_params
        params.require(:beer).permit(:name, :style, :abv, :brewery_id, :category_id)
    end
end
