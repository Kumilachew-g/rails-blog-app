Rails.application.routes.draw do
  get 'posts/new', to: 'posts#new'
  post 'posts', to: 'posts#create'
  post 'likes/:post_id', to: 'likes#create'
  post 'comments/:post_id', to: 'comments#create'
  resources :users, only: [:index, :show] do
  resources :posts, on: :show, only: [:index, :show]
  end

  root "users#index"
end
