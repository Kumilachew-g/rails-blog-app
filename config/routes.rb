Rails.application.routes.draw do
  resources :users, only:[:index, :show] do
end
end
