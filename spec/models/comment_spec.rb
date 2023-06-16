require 'rails_helper'

RSpec.describe Comment, type: :model do
  let(:user) { User.create(name: 'Ikoote', photo: 'https://unsplash.com/photos/F_-0BxGuVvo', bio: 'I always loved to work with you in my life', posts_counter: 5) }
  let(:post) { Post.create(user: user, title: 'My name is God', text: 'I always loved to work with you in my life', comments_counter: 0, likes_counter: 0) }
  let!(:comment) { Comment.create(user: user, post: post, text: 'This is a comment') }

  before do
    post.update(comments_counter: 0)
  end

  describe '#update_post_comments_counter' do
    it 'updates the comments_counter of the associated post' do
      expect {
        comment.update_post_comments_counter
      }.to change { post.reload.comments_counter }.from(0).to(1)
    end
  end
end
