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
        # byebug
        # @comment = UserComment.create(comment_params)
        new_hash = {}
        params.each do |k, v|
            new_hash[v] = k
        end
        user = current_user
        beer_id = new_hash["Save "].to_i
        
        @user_comment = UserComment.new(comment: params[:comment])
        @user_comment.user_id = session[:user_id]
        @user_comment.beer_id = beer_id
        @user_comment.save

        if @user_comment.valid?
            redirect_to @user_comment.user 
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
        params.require(:user_comment).permit(:comment)
    end
end
