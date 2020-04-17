class UserBeersController < ApplicationController
  def new
    @user_beer = UserBeer.new
    @beers = Beer.all
  end

  def create 
    new_hash = {}
    params.each do |k, v|
      new_hash[v] = k
    end
  
    user = current_user
  
    beer_id = new_hash["Add"].to_i
    @user_beer = UserBeer.new(user_id: session[:user_id], beer_id: beer_id )

    @user_beer.save

    if @user_beer.valid?
      redirect_to @user_beer.user 
    else
      render :new 
    end
  end

  def destroy
    # byebug
    
    @user_beer = UserBeer.find_by(beer_id: params[:beer_id], user_id: current_user.id)
    user = @user_beer.user
    @user_beer.destroy
    redirect_to user_path(user.id)
  end
end
