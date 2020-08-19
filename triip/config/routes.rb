Rails.application.routes.draw do
  resources :comments
  resources :users
  resources :destinations
  get "/random_destination", to: "destinations#random_destination"
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
