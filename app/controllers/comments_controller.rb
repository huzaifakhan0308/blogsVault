class CommentsController < ApplicationController
  load_and_authorize_resource

  def index
    @user = User.find(params[:user_id])
    @post = Post.find(params[:post_id])
    @comments = @post.comments
    respond_to do |format|
      format.json { render json: @comments }
    end
  end

  def new
    @comment = Comment.new
  end

  def create
    @comment = current_user.comments.new(comment_params)
    @comment.post_id = params[:post_id]
    respond_to do |format|
      if @comment.save
        format.html { redirect_to request.referrer, notice: 'Comment was successfully created.' }
        format.json { render Json: @comment, status: :created }
      else
        format.html { render :new }
        format.json { render json: { errors: @comment.errors.full_messages }, status: :unprocessable_entity }
      end
    end
  end

  def destroy
    @comment = Comment.find(params[:id])
    @comment.destroy
    redirect_to request.referrer
  end

  private

  def comment_params
    params.require(:comment).permit(:text)
  end
end
