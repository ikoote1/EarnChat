require 'rails_helper'

RSpec.feature 'User Index Page' do
  scenario 'displays user information and redirects to user show page on click' do
    # Assuming you have some users in your test database
    user = User.create(name: 'Ikoote rasuli', photo: 'user_photo.jpg', bio: 'I am good', posts_counter: 5)
    visit '/users' # or visit users_path

    expect(page).to have_content('LIST OF USERS')
    expect(page).to have_content('Ikoote rasuli')
    expect(page).to have_css("img[src*='user_photo.jpg']")
    expect(page).to have_content('Number of posts: 5')

    click_link 'Ikoote rasuli'
    expect(current_path).to eq(user_path(user))
  end
end