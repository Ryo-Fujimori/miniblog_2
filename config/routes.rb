Rails.application.routes.draw do
  root "posts#index"
  
  devise_for :users
  
  resources :users, only: [ :index ]
  resources :posts
  resources :relationships, only: [ :create, :destroy ]
  
  get "up" => "rails/health#show", as: :rails_health_check
end
