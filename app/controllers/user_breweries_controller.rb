class UserBreweriesController < ApplicationController

  def new 
    @user_brewery = UserBrewery.new
    @breweries = Brewery.all 
  end

  def create 
    @user_brewery = UserBrewery.new(user_brewery_params)
    @user_brewery.user_id = session[:user_id]
    @user_brewery.save

    if @user_brewery.valid?
      redirect_to @user_brewery.user
    else
      render :new 
    end
  end

  def destroy
    @user_brewery = UserBrewery.find(params[:id])
    user = @user_brewery.user
    @user_brewery.destroy
    redirect_to user
  end

  private 

  def user_brewery_params 
    params.require(:user_brewery).permit(:brewery_id)
  end
end
