class CommentsController < ApplicationController
  def new
    @comment = Comment.new
  end

  def create
    @comment = Comment.new(
      text: params[:text],
      post_id: params[:post_id]
    )
    @comment.user_id = current_user.id
    if @comment.save
      flash[:notice] = 'Comment was successfully created.'
      redirect_to user_post_path(params[:user_id], params[:post_id])
    else
      flash.now[:alert] = 'Comment was not created.'
      render 'posts/show'
    end
  end
end
