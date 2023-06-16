class Post < ApplicationRecord
  belongs_to :user
  has_many :posts, foreign_key: 'post_id'
  has_many :likes, foreign_key: 'post_id'

  validate :title, presence: true, length: {maximum: 200}
  validate :comments_counter, length: {minimum: 0}, numericality: {only_integer: true}
  validate :likes_counter, comparison: length: {minimum: 0}, numericality: {only_integer: true}

  def update_user_posts_counter
    user.update(posts_counter: user.posts.count)
  end

  def recent_comments
    comments.order(created_at: :desc).limit(5)
  end
end
