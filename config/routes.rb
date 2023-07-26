Rails.application.routes.draw do
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Defines the root path route ("/")
  post '/users/new', to: 'users#new'
  post '/users/edit/:id', to: 'users#edit'
  post '/users/:id/posts/edit/:id', to: 'posts#edit'
  post '/users/:id/posts/new', to: 'posts#new'
  post '/users/:id/posts/:id/comments/new', to: 'comments#new'
  post '/users/:id/posts/:id/comments/edit/:id', to: 'comments#edit'
  resources :users, only: [:index, :show] do
    resources :posts, only: [:index, :show] do
      resources :comments, only: [:index, :show]
    end
  end
end
