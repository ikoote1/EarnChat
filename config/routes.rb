Rails.application.routes.draw do

  # get 'users', controller: 'users', action: 'index'
  # get 'users', to: 'users#index'
  # get 'users/:id', to: 'users#show', as: 'user'
  # get 'users/:user_id/posts', to: 'posts#index', as: 'user_posts'
  # get 'users/:user_id/posts/:id', to: 'posts#show', as: 'user_post'
  resources :users, only: [:index, :show] do
    resources :posts, only: [:index, :show] do
      resources :comments, only: [:create]
      resources :likes, only: [:create]
    end
    
    member do
      get 'show_to_index' # This will generate the route helper method user_show_to_index_path
    end
  end
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Defines the root path route ("/")
  # root "articles#index"
  # resources :posts
end
