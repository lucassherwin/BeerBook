class ApplicationController < ActionController::Base
  helper_method :current_user
  before_action :current_user, :authorize

  def current_user
    @current_user ||= User.find_by(id: session[:user_id])
  end

  def authorize
    unless current_user
      redirect_to root_path
    end
  end
end