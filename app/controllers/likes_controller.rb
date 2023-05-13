class LikesController < ApplicationController
  def create
    @like = current_user.likes.new(
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
