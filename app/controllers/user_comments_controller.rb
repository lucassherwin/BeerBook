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
        @comment = UserComment.create(comment_params)
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
