Rails.application.routes.draw do
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Defines the root path route ("/")
  devise_for :users

  root to: "users#index"
  # get '/users/:user_id/posts/:id/likes', to: 'likes#create', as: 'user_post_likes'
  resources :users, only: [:index, :show] do
    resources :posts, only: [:index, :show, :new, :create, :destroy] do
      resources :comments, only: [:new,:index, :show, :create, :destroy]
      resources :likes, only: [:create]
    end
  end
end
