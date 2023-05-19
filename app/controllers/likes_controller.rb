class LikesController < ApplicationController
  def create
    @user = User.find(current_user.id)
    @post = Post.find(params[:post_id])
    @like = @post.likes.new
    @like.author = @user
    if @like.save
      flash[:notice] = 'Like was successfully created.'
      redirect_to user_post_path(params[:user_id], params[:post_id])
    else
      flash.now[:alert] = 'Like was not created.'
      render 'posts/show'
    end
  end
end
