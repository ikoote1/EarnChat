#http://localhost:3000/api/users/1/posts
module Api
  class PostsController < ApiController
    def index
      @user = User.find(params[:user_id])
      @posts = @user.posts # Add this line to fetch the user's posts
      render json: @posts
    end
  end
end
