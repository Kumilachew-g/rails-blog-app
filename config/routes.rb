Rails.application.routes.draw do
  devise_for :users
  get 'posts/new', to: 'posts#new'
  post 'posts', to: 'posts#create'
  post 'likes/:post_id', to: 'likes#create'
  post 'comments/:post_id', to: 'comments#create'
  resources :users, only: [:index, :show] do
  resources :posts, :show, only: [:index, :show, :new, :create, :destroy] do
    resources :likes, only: [:create]
    resources :comments, only: [:create, :new , :destroy]
  end
  end

  root "users#index"
end
