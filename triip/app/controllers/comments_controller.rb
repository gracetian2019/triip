class CommentsController < ApplicationController
before_action :set_params, only: [:show, :update, :destroy]

    def index
        @comments = Comment.all

         render json: @comments, status: 200
    end
    
    def create
       @comment = Comment.create(comment_params)

        render json: @comment, status: 200
    end
    def show
        @comment = Comment.find(params[:id])
        render json: @comment, status: 200
    end
private 
def comment_params
    params.require(:comment).permit(:comment, :destination_id)
end
def set_params
    @comment = Comment.find(params[:id])
end
end
