class PostsController < ApplicationController
  def index
    @user = User.find(params[:user_id])
    @posts = @user.posts.includes(:comments) # Fetch the comments associated with each post
  end

  def show
  end
end
