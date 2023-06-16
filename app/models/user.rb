class User < ApplicationRecord
  has_many :posts, foreign_key: 'user_id'
  has_many :comments, foreign_key: 'user_id'
  has_many :likes, foreign_key: 'user_id'

  validate :name, presence: true
  validate :posts_counter, comparison: {greater_than_or_equal_to: :0}, numericality: {only_integer: true}

  def recent_posts
    posts.order(created_at: :desc).limit(3)
  end
end
