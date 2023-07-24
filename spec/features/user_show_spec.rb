require 'rails_helper'

RSpec.feature 'User Show Page' do
  scenario 'displays user details and redirects to user post index page on click' do
    # Assuming you have some users and posts in your test database
    user = User.create(name: 'Ikoote rasuli', photo: 'user_photo.jpg', bio: 'I am good', posts_counter: 5)
    post1 = Post.create(title: 'Post 1', text: 'Post 1 text', user: user)
    post2 = Post.create(title: 'Post 2', text: 'Post 2 text', user: user)
    post3 = Post.create(title: 'Post 3', text: 'Post 3 text', user: user)

    visit user_path(user)

    expect(page).to have_content('USER DETAILS')
    expect(page).to have_content('John Doe')
    expect(page).to have_css("img[src*='user_photo.jpg']")
    expect(page).to have_content('Number of posts: 5')
    expect(page).to have_content('This is my bio.')

    expect(page).to have_content('Post 1')
    expect(page).to have_content('Post 2')
    expect(page).to have_content('Post 3')

    click_button 'See all posts'
    expect(current_path).to eq(show_to_index_user_path(user))
  end

  scenario 'redirects to post show page on click post title' do
    user = User.create(name: 'Ikoote rasuli', photo: 'user_photo.jpg', bio: 'I am good', posts_counter: 5)
    post = Post.create(title: 'Post Title', text: 'Post text', user: user)

    visit user_path(user)
    click_link 'Post Title'
    expect(current_path).to eq(user_post_path(user, post))
  end
end