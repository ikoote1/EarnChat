class CommentsController < ApplicationController
  load_and_authorize_resource :post
  load_and_authorize_resource :comment, through: :post, shallow: true

  def create
    @user = User.find(params[:user_id])
    @post = @user.posts.find(params[:post_id])
    @comment = @post.comments.build(comment_params)
    @comment.user = @user

    if @comment.save
      redirect_to user_post_path(@user, @post), notice: 'Comment was successfully created.'
    else
      redirect_to user_post_path(@user, @post), alert: 'Error creating comment.'
    end
  end

  def destroy
    @comment.destroy
    redirect_to user_post_path(@user, @post), notice: 'Comment was successfully deleted.'
  end

  private

  def comment_params
    params.require(:comment).permit(:text)
  end
end

# class CommentsController < ApplicationController
#   def create
#     @user = User.find(params[:user_id])
#     @post = @user.posts.find(params[:post_id])
#     @comment = @post.comments.build(comment_params)
#     @comment.user = @user

#     if @comment.save
#       redirect_to user_post_path(@user, @post), notice: 'Comment was successfully created.'
#     else
#       redirect_to user_post_path(@user, @post), alert: 'Error creating comment.'
#     end
#   end

#   private

#   def comment_params
#     params.require(:comment).permit(:text)
#   end
# end
