class LikesController < ApplicationController
  def create
    @user = User.find(params[:user_id])
    @post = @user.posts.find(params[:post_id])
    @like = @post.likes.build(user: @user)

    if @like.save
      redirect_to user_post_path(@user, @post), notice: 'Like added.'
    else
      redirect_to user_post_path(@user, @post), alert: 'Error adding like.'
    end
  end
end
