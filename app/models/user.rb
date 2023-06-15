class User < ApplicationRecord
  has_many :posts, foreigm_key :'user_id'
  has_many :comments, foreigm_key :'user_id'
  has_many :likes, foreigm_key :'user_id'

  def recent_posts(limit = 3)
    posts.order(created_at: :desc).limit(limit)
  end

end
