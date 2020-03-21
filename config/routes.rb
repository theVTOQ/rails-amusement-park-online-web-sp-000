Rails.application.routes.draw do
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  resource :user, only: [:new, :create, :show]
  get "/signin", to: "sessions#new"
  post "/signin", to: "sessions#create"
  post "/signout", to: "sessions#destroy"
end
