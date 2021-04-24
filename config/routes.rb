Rails.application.routes.draw do
  #get 'shares/index'
  devise_for :users
  root to: 'shares#index'
  resources :shares do
    resources :comments, only: [:create]
    resources :likes, only: [:create, :destroy]
  end
  resources :users, only: [:show]
end
