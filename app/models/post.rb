class Post < ApplicationRecord
  belongs_to :user
  has_many :posts, foreign_key: 'post_id'
  has_many :likes, foreign_key: 'post_id'

  def update_user_posts_counter
    user.update(posts_counter: user.posts.count)
  end
  
  def recent_comments
    comments.order(created_at: :desc).limit(5)
  end

end
