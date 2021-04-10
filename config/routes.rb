Rails.application.routes.draw do
  #get 'shares/index'
  devise_for :users
  root to: 'shares#index'
  resources :share, only: [:index, :new]
end
