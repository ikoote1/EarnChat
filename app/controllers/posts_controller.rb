class PostsController < ApplicationController
  load_and_authorize_resource
  def index
    @user = User.find(params[:user_id])
    @posts = @user.posts.includes(:comments)
  end

  def new
    @user = User.find(params[:user_id])
    @post = @user.posts.build
  end

  def show
    @user = User.find(params[:user_id])
    @post = @user.posts.includes(:comments).find(params[:id])
  end

  def destroy
    @post.destroy
    redirect_to user_posts_path(current_user), notice: 'Post was successfully deleted'
  end
end
