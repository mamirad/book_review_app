Rails.application.routes.draw do
  devise_for :users ,:path => 'users'

  devise_scope :users do
    get '/users/:id/following(.:format)', :to => 'home#following', as: :following_user
    get '/users/:id/followers(.:format)', :to => 'home#followers',  as: :followers_user
    resources :books do
      resources :reviews
    end
  end
  
  get 'home/index'
  resources :relationships,       only: [:create, :destroy]

  # resources :users do
  #   resources :books do
  #     resources :reviews
  #   end
  # end
  
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Defines the root path route ("/")
  root "home#index"
end
