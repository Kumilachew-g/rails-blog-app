Rails.application.routes.draw do
  devise_for :users

  # namespace :api do
  #   post 'users/sign_in' => 'users#login'
  #   get 'user/:id/posts' => 'posts#index'
  #   get 'comments' => 'comments#index'
  #   post 'comments/create' => 'comments#create'
  # end

  namespace :api, defaults: { format: :json } do
    resources :users, only: %i[index show] do
      resources :posts, only: %i[index show] do
        resources :comments, only: %i[index show create]
      end
    end
  
end

  devise_scope :user do 
    get '/users/sign_out' => 'devise/sessions#destroy' 
  end

  get 'posts/new', to: 'posts#new'
  post 'posts', to: 'posts#create'
  post 'likes/:post_id', to: 'likes#create'
  post 'comments/:post_id', to: 'comments#create'
  resources :users, only: [:index, :show] do
  resources :posts, :show, only: [:index, :show, :new, :create, :destroy] do
    resources :likes, only: [:create]
    resources :comments, only: [:index, :create, :new , :destroy]
  end
  end

  root "users#index"
end
