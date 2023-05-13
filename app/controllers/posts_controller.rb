class PostsController < ApplicationController
  def index
    @user = User.find(params[:user_id])
    @posts = @user.posts.order(created_at: :desc)
  end

  def show
    @user = User.find(params[:user_id])
    @post = @user.posts.find(params[:id])
  end

  def new
    @post = Post.new
    respond_to do |format|
      format.html { render :new, locals: { post: @post } }
    end
  end

  def create
    @post = Post.new(
      title: params[:post][:title],
      text: params[:post][:text]
    )
    @post.user_id = params[:user_id]
    @post.commentscounter = 0
    @post.likescounter = 0
    if @post.save
      flash[:notice] = 'Post was successfully created.'
      redirect_to user_post_path(params[:user_id], @post)
    else
      flash.now[:alert] = 'Post was not created.'
      render :new
    end
  end
end
