class DistributionsController < ApplicationController

  def show
    @distribution = Distribution.find(params[:id])
  end
end
