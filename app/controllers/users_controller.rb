class UsersController < ApplicationController
  def index
    @users = User.all
  end

  def show
    @user = User.find(params[:id])
    @posts = @user.posts
  end

  def show_to_index
    @user = User.find(params[:id])
    redirect_to user_posts_path(@user)
  end
end
