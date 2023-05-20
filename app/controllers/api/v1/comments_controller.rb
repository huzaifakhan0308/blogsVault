class Api::V1::CommentsController < ApplicationController
    
    def index
        @user = User.find(params[:user_id])
        @post = Post.find(params[:post_id])
        @comments = @post.comments
        render json: @comments
    end

    def create
        @comment = Comment.new(comment_params)

        if @comment.save
            render json: @comment, status: :created
        else
            render json: @comment.errors, status: :unprocessable_entity
        end
    end

    private

    def comment_params
        params.require(:comment).permit(:post_id, :text, :author_id)
    end
end
