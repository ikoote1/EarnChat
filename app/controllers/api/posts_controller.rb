# controllers/api/comments_controller.rb
#http://localhost:3000/api/users/1/posts/1/comments
module Api
    class PostsController < ApiController
      def index
        @user = User.find(params[:user_id])
        @post = @user.posts.
        render json: @posts
      end
    end
  end
  