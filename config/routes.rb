Rails.application.routes.draw do
  devise_for :users
  resources :users
  root "events#index"
  resources :events

  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Defines the root path route ("/")
  # root "articles#index"
end
