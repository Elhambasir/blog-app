Rails.application.routes.draw do
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Defines the root path route ("/")
  post '/users/new', to: 'users#new'
  post '/users/edit/:user_id', to: 'users#edit'
  post '/users/:user_id/posts/edit/:post_id', to: 'posts#edit'
  post '/users/:user_id/posts/new', to: 'posts#new'
  post '/users/:user_id/posts/:post_id/comments/new', to: 'comments#new'
  post '/users/:user_id/posts/:post_id/comments/edit/:comment_id', to: 'comments#edit'
  root to: "users#index"
  resources :users, only: [:index, :show] do
    resources :posts, only: [:index, :show] do
      resources :comments, only: [:index, :show]
    end
  end
end
