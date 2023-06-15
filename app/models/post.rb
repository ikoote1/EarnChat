class Post < ApplicationRecord
  belongs_to :user
  has_many :posts
  has_many :likes

  def recent_comments(limit = 5)
    comments.order(created_at: :desc).limit(limit)
  end

  def update_comments_counter
    update(comments_counter: comments.count)
  end

  def update_likes_counter
    update(likes_counter: likes.count)
  end
end
