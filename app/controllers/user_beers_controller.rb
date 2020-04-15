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
    @user_beer = UserBeer.find(params[:id])
    user = @user_beer.user
    @user_beer.destroy
    redirect_to user_path(user.id)
  end

  # private 

  # def user_beer_params
  #   params.require(:user_beer).permit(:beer_id)
  # end
end
