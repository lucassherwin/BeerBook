class BeersController < ApplicationController
    before_action :find_beer, only: [:show]

    def index
        @beers = Beer.all
    end

    def show
        #find
    end

    # def new
    #     @beer = Beer.new
    # end

    # def create
    #     @beer = Beer.create(beer_params)
    # end 

    # def edit
    #     #find
    # end

    # def update
    #     @beer.update(beer_params)
    # end

    def destroy
        @user = User.find(session[:user_id])
        @user.beers.find do |b|
            b.id == 
        end
    end

    private

    def find_beer
        @beer = Beer.find(params[:id])
    end

    def beer_params
        params.require(:beer).permit(:name, :style, :abv, :brewery_id, :category_id)
    end
end
