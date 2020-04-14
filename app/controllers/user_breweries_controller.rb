class UserBreweriesController < ApplicationController

  def new 
    @user_brewery = UserBrewery.new
  end

  def create 
    @user_brewery = UserBrewery.create(user_brewery_params)

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
end
