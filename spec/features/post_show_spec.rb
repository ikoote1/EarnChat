require 'rails_helper'

RSpec.feature 'Post Show Page' do
  scenario 'displays post details and comment details' do
    # Assuming you have some users, posts, and comments in your test database
    user = User.create(name: 'Ikoote rasuli', photo: 'user_photo.jpg', bio: 'I am good', posts_counter: 5)
    post = Post.create(user:, title: 'Post Title', text: 'Post text')
    Comment.create(user:, post:, text: 'Comment 1')
    Comment.create(user:, post:, text: 'Comment 2')

    visit user_post_path(user, post)

    expect(page).to have_content('POST DETAILS')
    expect(page).to have_content('Post Title')
    expect(page).to have_content('Number of comments:')
    expect(page).to have_content('Number of likes:')
    expect(page).to have_content('Post text')

    expect(page).to have_content('Ikoote rasuli')
    expect(page).to have_content('Comment 1')
    expect(page).to have_content('Comment 2')
  end
end
