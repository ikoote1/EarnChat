class Like < ApplicationRecord
  belongs_to :user
  belongs_to :post

  after_create :update_post_likes_counter

  def update_post_likes_counter
    # post.update(likes_counter: post.likes.count)
    puts "Before update: #{post.likes_counter}"
  post.update(likes_counter: post.likes.count)
  puts "After update: #{post.likes_counter}"

  end
end
