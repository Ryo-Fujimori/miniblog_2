Rails.application.routes.draw do
  devise_for :users
  resources :users, only: [ :index ]
  get "up" => "rails/health#show", as: :rails_health_check
  root "posts#index"
  resources :posts
  resources :relationships, only: [ :create, :destroy ]
end
