class UserCommentsController < ApplicationController
    def index
        @comments = UserComment.all
    end

    def show
        @comment = UserComment.find(params[:id])
    end

    def new
        @comment = UserComment.new
    end

    def create
        byebug
        @comment = UserComment.create(comment_params)
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

    def edit
        @comment = UserComment.find(params[:id])
    end

    def update
        @comment = UserComment.find(params[:id])
        @comment.update(comment_params)
    end

    def destroy
        @comment = UserComment.find(params[:id])
        @comment.destroy
    end

    private

    def comment_params
        params.require(:user_comment).permit(:comment, :user_id, :beer_id)
    end
end
