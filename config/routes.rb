Rails.application.routes.draw do
  devise_for :users
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Defines the root path route ("/")
  resources :posts
  resources :comments
  get "/users/:user_id/posts", to: "posts#user_posts", as: 'user_post'
  root "pages#index"
end
