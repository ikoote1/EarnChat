class Post < ApplicationRecord
  belongs_to :user
  has_many :posts, foreigm_key :'post_id'
  has_many :likes, foreigm_key :'post_id'

  def recent_comments(limit = 5)
    comments.order(created_at: :desc).limit(limit)
  end
  
  def update_posts_counter
    update(posts_counter: posts.count)
  end

end
