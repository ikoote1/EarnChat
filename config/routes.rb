Rails.application.routes.draw do
  devise_for :users
  get 'comments/create'

  resources :users, only: [:index, :show] do
    resources :posts, only: [:index, :show, :new, :create] do
      resources :comments, only: [:create]
      resources :likes, only: [:create]
    end
    
    member do
      get 'show_to_index' # This will generate the route helper method user_show_to_index_path
    end
  end
end
