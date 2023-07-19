require 'rails_helper'

RSpec.describe "Posts", type: :request do
  describe "GET /index" do
    it "renders the index template and returns a successful response" do
      user = User.create!(name: "preim", photo: "https://unsplash.com/photos/F_-0BxGuVvo", bio: "am married")
      user.posts.create!(title: "Post 1", text: "Content of post 1")
      user.posts.create!(title: "Post 2", text: "Content of post 2")

      get user_posts_path(user_id: user.id)

      expect(response).to have_http_status(:success)
      expect(response).to render_template(:index)
    end
  end

  describe "GET /show" do
    it "renders the show template and returns a successful response" do
      user = User.create!(name: "preim", photo: "https://unsplash.com/photos/F_-0BxGuVvo", bio: "am married")
      post = user.posts.create!(title: "Post 1", text: "Content of post 1")

      get user_post_path(user_id: user.id, id: post.id)

      expect(response).to have_http_status(:success)
      expect(response).to render_template(:show)
    end
  end
end
