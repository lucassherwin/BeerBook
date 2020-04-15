class SessionsController < ApplicationController

  def new
  end

  def create
    user = User.find_by(email: params[:email])
    if user && user.authenticate(params[:password])
      # saving user id in session hash, backed by browser's cookies
      session[:user_id] = user.id
      # flash[:success] = "You have successfully logged in"
      redirect_to user
    else
      # flash.now[:danger] = "There was something wrong with your login information"
      redirect_to root_path
    end
  end

  def destroy
    session.delete :user_id
    flash[:success] = "You have logged out"
    redirect_to root_path
  end
end