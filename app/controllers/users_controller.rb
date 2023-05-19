class UsersController < ApplicationController
  before_action :authenticate_user!
  load_and_authorize_resource except: :sign_out_and_redirect

  def index
    @users = User.all
  end

  def show
    @user = User.find(params[:id])
    @posts = @user.three_recent_posts
  end

  def sign_out_and_redirect
    sign_out current_user
    redirect_to root_path
  end
end
