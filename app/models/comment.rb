class Comment < ApplicationRecord
  belongs_to :user, class_name: 'User'
  belongs_to :post, class_name: 'Post'

  after_save :update_post_comments_counter

  def update_post_comments_counter
    post.update(comments_counter: post.comments.count)
  end
end
