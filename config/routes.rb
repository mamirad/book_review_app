Rails.application.routes.draw do
  devise_for :users ,:path => 'users'

  devise_scope :users do
    resources :followers, only: [:index]
    resources :following, only: [:index]
    resources :relationships, only: [:create, :destroy]
    resources :books do
      resources :reviews
    end
  end 
  root "home#index"
end
