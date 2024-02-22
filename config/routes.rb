Rails.application.routes.draw do
  devise_for :users
  root 'items#index'
  resources :items do
    resources :comments, only: :create
    resources :trades, only: [:index, :create]
  end
end
