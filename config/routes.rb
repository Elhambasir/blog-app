Rails.application.routes.draw do
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html
  mount Rswag::Ui::Engine => '/api-docs'
  mount Rswag::Api::Engine => '/api-docs'
  namespace :api do
    namespace :v1 do
      resources :comments
    end
  end
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

 get '/api/users', to: 'api_users#index'
 get "/api/users/:id", to: "api_users#show"
 get '/api/users/:user_id/posts', to: 'api_posts#index'
 get '/api/users/:user_id/posts/:post_id/comments', to: 'api_comments#index'
 post '/api/users/:user_id/posts/:post_id/comments', to: 'api_comments#create'
end
