require 'rails_helper'

RSpec.describe Post, type: :model do
  let(:user) { User.create(name: 'Ikoote', photo: 'https://unsplash.com/photos/F_-0BxGuVvo', bio: 'I always loved to work with you in my life', posts_counter: 5) }

  subject do
    Post.new(user:, title: 'My name is God', text: 'I always loved to work with you in my life', comments_counter: 20,
             likes_counter: 5)
  end

  before { subject.save }

  it 'title should be present' do
    subject.title = nil
    expect(subject).to_not be_valid
  end

  it 'comments_counter to be an integer' do
    subject.comments_counter = 11
    expect(subject).to be_valid
  end
  it 'comments_counter to me greater than or equal to 0' do
    subject.comments_counter = 5
    expect(subject).to be_valid
  end

  it 'likes_counter to be an interger' do
    subject.likes_counter = 6
    expect(subject).to be_valid
  end

  it 'likes_counter to me greater than or equal to 0' do
    subject.likes_counter = 5
    expect(subject).to be_valid
  end
  # pending "add some examples to (or delete) #{__FILE__}"
end
