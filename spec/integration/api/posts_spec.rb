# spec/integrationapi/posts_spec.rb
require 'swagger_helper'

describe 'Posts API' do
    let(:user) { User.create(name: 'Ikoote', photo: 'https://unsplash.com/photos/F_-0BxGuVvo', bio: 'I always loved to work with you in my life', posts_counter: 5) }
    path 'api/users/{id}/posts' do

        get 'Retrieves a Posts' do
            tags 'Posts'
            produces 'application/json'
            parameter name: :id, :in => :path, :type => :string
      
            response '200', 'name found' do
              schema type: :object,
                properties:[ {
                  id: { type: :integer, },
                  title: { type: :string },
                  text: { type: :text },
                  user_id: { type: :bigint },
                  comments_counter: { type: :integer },
                  likes_counter: { type: :integer },
                  created_at: { type: :datetime },
                  updated_at: { type: :datetime }
                }],
                required: [ 'id', 'title', 'text', user: ]
      
                let(:id) { Post.create(title: 'foo', text: 'bar', user:).id }
                run_test!
              run_test!
            end

            response '404', 'pet not found' do
              let(:id) { 'invalid' }
              run_test!
            end
        end
    end
end
