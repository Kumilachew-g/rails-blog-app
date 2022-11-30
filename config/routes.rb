Rails.application.routes.draw do
  resources :users, only: [:index, :show] 
  resources :posts, on: :show, only: [:index, :show]

  root "users#index"
end
