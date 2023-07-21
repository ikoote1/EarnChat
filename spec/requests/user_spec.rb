require 'rails_helper'

RSpec.describe 'Users', type: :request do
  describe 'GET /index' do
    it 'renders the index template and returns a successful response' do
      get users_path

      expect(response).to have_http_status(:success)
      expect(response).to render_template(:index)
    end
  end

  describe 'GET /show' do
    it 'renders the show template and returns a successful response' do
      user = User.create!(name: 'preim', photo: 'https://unsplash.com/photos/F_-0BxGuVvo', bio: 'am married')
      get user_path(user)

      expect(response).to have_http_status(:success)
      expect(response).to render_template(:show)
    end
  end
end
