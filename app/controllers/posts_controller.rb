class PostsController < ApplicationController
  def index
    @user = User.find(params[:user_id])
    @posts = @user.posts.includes(:comments)
  end

  def new
    @user = User.find(params[:user_id])
    @post = @user.posts.build
  end

  # def show
  #   @user = User.find(params[:user_id])
  #   @post = @user.posts.find(params[:id])
  # end
  def show
    @user = User.find(params[:user_id])
    @post = @user.posts.includes(:comments).find(params[:id])
  end
end
