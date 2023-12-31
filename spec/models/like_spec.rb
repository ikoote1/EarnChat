require 'rails_helper'

RSpec.describe Like, type: :model do
  let(:user) { User.create(name: 'Ikoote', photo: 'https://unsplash.com/photos/F_-0BxGuVvo', bio: 'I always loved to work with you in my life', posts_counter: 5) }
  let(:post) do
    Post.create(user:, title: 'My name is God', text: 'I always loved to work with you in my life',
                comments_counter: 20, likes_counter: 0)
  end
  let!(:like) { Like.create(user:, post:) }

  before do
    post.update(likes_counter: 0)
  end

  describe '#update_post_likes_counter' do
    it 'updates the likes_counter of the associated post' do
      expect do
        like.update_post_likes_counter
      end.to change { post.reload.likes_counter }.from(0).to(1)
    end
  end
end
