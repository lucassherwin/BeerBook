class SessionsController < ApplicationController
  skip_before_action :authorize

  def new
  end

  def create
    if User.find_by(email: params[:username])
      user = User.find_by(email: params[:username])
    else
      user = User.find_by(username: params[:username])
    end
    
    if user && user.authenticate(params[:password])
      # saving user id in session hash, backed by browser's cookies
      session[:user_id] = user.id
      redirect_to user
    else
      flash[:error] = "There was something wrong with your login information"
      redirect_to root_path
    end
  end

  def destroy
    session.delete :user_id
    flash[:success] = "You have logged out"
    redirect_to root_path
  end
end