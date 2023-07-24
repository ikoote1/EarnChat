require 'rails_helper'

RSpec.feature 'Post Show Page' do
  scenario 'displays post details and comment details' do
    # Assuming you have some users, posts, and comments in your test database
    user = User.create(name: 'John Doe', photo: 'user_photo.jpg', posts_counter: 5)
    post = Post.create(title: 'Post Title', text: 'Post text', user: user)
    comment1 = Comment.create(text: 'Comment 1', post: post, user: user)
    comment2 = Comment.create(text: 'Comment 2', post: post, user: user)

    visit user_post_path(user, post)

    expect(page).to have_content('POST DETAILS')
    expect(page).to have_content('Post Title')
    expect(page).to have_content('Number of comments:')
    expect(page).to have_content('Number of likes:')
    expect(page).to have_content('Post text')

    expect(page).to have_content('John Doe')
    expect(page).to have_content('Comment 1')
    expect(page).to have_content('Comment 2')
  end
end