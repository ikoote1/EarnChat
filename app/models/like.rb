class Like < ApplicationRecord
  belongs_to :user
  belongs_to :post
 
  def update_likes_counter
    update(likes_counter: likes.count)
  end
end
