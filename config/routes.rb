Rails.application.routes.draw do
  #get 'shares/index'
  devise_for :users
  root to: 'shares#index'
  resources :shares, only: [:index, :new, :create, :show, :edit, :update, :destroy] do
    resources :comments, only: [:create]
  end
end
