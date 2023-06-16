require 'rails_helper'

RSpec.describe User, type: :model do
  subject { User.new(name: 'Ikoote', photo: 'https://unsplash.com/photos/F_-0BxGuVvo', bio: 'I always loved to work with you in my life', posts_counter: 5) }

  before { subject.save }

  it 'name should be present' do
    subject.name = nil
    expect(subject).to_not be_valid
  end

  it 'posts_counter to be an integer' do
    subject.posts_counter = 11
    expect(subject).to be_valid
  end
  it 'posts_counter to me greater than or equal to 0' do
    subject.posts_counter = 5
    expect(subject).to be_valid
  end
  # pending "add some examples to (or delete) #{__FILE__}"
end
