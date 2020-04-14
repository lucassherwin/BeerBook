class UserBeersController < ApplicationController
  def new
    @user_beer = UserBeer.new
    @beers = Beer.all
  end

  def create 
    @user_beer = UserBeer.new(user_beer_params)
    @user_beer.user_id = session[:user_id]
    @user_beer.save

    if @user_beer.valid?
      redirect_to @user_beer.user 
    else
      render :new 
    end
  end

  def destroy
    @user_beer = UserBeer.find(params[:id])
    user = @user_beer.user
    @user_beer.destroy
    redirect_to user_path(user.id)
  end

  private 

  def user_beer_params
    params.require(:user_beer).permit(:beer_id)
  end
end
