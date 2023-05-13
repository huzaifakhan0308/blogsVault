class LikesController < ApplicationController
  def create
    @like = Like.new(
      author_id: current_user.id,
      post_id: params[:post_id]
    )
    if @like.save
      flash[:notice] = 'Like was successfully created.'
      redirect_to user_post_path(params[:user_id], params[:post_id])
    else
      flash.now[:alert] = 'Like was not created.'
      render 'posts/show'
    end
  end
end
