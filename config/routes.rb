Rails.application.routes.draw do
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  resources :users, only: [:new, :create, :show]
  resources :rides, only: [:create]
  resources :attractions, only: [:new, :create, :index, :show, :edit, :update]
  get "/signup", to: "users#new"
  get "/signin", to: "sessions#new"
  post "/signin", to: "sessions#create"
  get "/signout", to: "sessions#destroy"
  #get "/attractions", to: "attractions#index"
  root "users#new"
end
