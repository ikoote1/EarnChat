require 'rails_helper'

RSpec.feature 'User Show Page' do
  scenario 'displays user details and redirects to user post index page on click' do
    user = User.create(name: 'Ikoote rasuli', photo: 'user_photo.jpg', bio: 'I am good', posts_counter: 3)
    post1 = Post.create(user: user, title: 'Post 1', text: 'Post 1 text')
    post2 = Post.create(user: user, title: 'Post 2', text: 'Post 2 text')
    post3 = Post.create(user: user, title: 'Post 3', text: 'Post 3 text')

    visit user_path(user)

    expect(page).to have_content('USER DETAILS')
    expect(page).to have_content('Ikoote rasuli')
    expect(page).to have_css("img[src*='user_photo.jpg']")
    expect(page).to have_content('Number of posts: 3')
    expect(page).to have_content('I am good')

    # Check if each post is displayed on the page
    expect(page).to have_content('Post 1')
    expect(page).to have_content('Post 2')
    expect(page).to have_content('Post 3')

    # Ensure the "See all posts" button is present
    expect(page).to have_button('See all posts')

    # Click the "See all posts" button
    click_button 'See all posts'

    # After clicking the button, check the redirection
    expect(current_path).to eq(user_posts_path(user))
  end
end
