class Post < ApplicationRecord
  belongs_to :user
  has_many :comments, foreign_key: 'post_id'
  has_many :likes, foreign_key: 'post_id'

  validates :title, presence: true, length: {maximum: 200}
  validates :comments_counter, numericality: {only_integer: true, greater_than_or_equal_to: 0}
  validates :likes_counter, numericality: {only_integer: true, greater_than_or_equal_to: 0}

  def update_user_posts_counter
    user.update(posts_counter: user.posts.count)
  end

  def recent_comments
    comments.order(created_at: :desc).limit(5)
  end
end
