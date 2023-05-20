class PostsController < ApplicationController
  load_and_authorize_resource

  def index
    @user = User.find(params[:user_id])
    @posts = @user.posts.order(created_at: :desc)

    respond_to do |format|
      format.html
      format.xml { render xml: @posts }
      format.json { render json: @posts }
    end
  end

  def show
    @user = User.find(params[:user_id])
    @post = @user.posts.find(params[:id])
    respond_to do |format|
      format.html
      format.xml { render xml: @post.comments }
      format.json { render json: @post.comments }
    end
  end

  def new
    @post = Post.new
    @user = User.find(params[:user_id])
  end

  def create
    @post = current_user.posts.new(post_params)
    @post.commentscounter = 0
    @post.likescounter = 0
    if @post.save
      flash[:notice] = 'Post was successfully created.'
      redirect_to user_post_path(current_user, @post)
    else
      flash.now[:alert] = 'Post was not created.'
      render :new
    end
  end

  def destroy
    @user = User.find(params[:user_id])
    @post = @user.posts.find(params[:id])
    @post.destroy
    redirect_to user_posts_path(@user), notice: 'Post was successfully deleted.'
  end

  private

  def post_params
    params.require(:post).permit(:title, :text)
  end
end
