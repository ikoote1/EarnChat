require 'rails_helper'

RSpec.feature 'User Post Index Page' do
  scenario 'displays user information and post details and redirects to post show page on click' do
    # Assuming you have some users and posts in your test database
    user = User.create(name: 'Ikoote rasuli', photo: 'user_photo.jpg', bio: 'I am good', posts_counter: 5)
    post1 = Post.create(title: 'Post 1', text: 'Post 1 text', user: user)
    post2 = Post.create(title: 'Post 2', text: 'Post 2 text', user: user)
    post3 = Post.create(title: 'Post 3', text: 'Post 3 text', user: user)

    visit show_to_index_user_path(user)

    expect(page).to have_content('John Doe')
    expect(page).to have_css("img[src*='user_photo.jpg']")
    expect(page).to have_content('Number of posts: 5')

    expect(page).to have_content('Post 1')
    expect(page).to have_content('Post 1 text')
    expect(page).to have_content('Number of comments:')
    expect(page).to have_content('Number of likes:')

    click_link 'Post 1'
    expect(current_path).to eq(user_post_path(user, post1))
  end
end