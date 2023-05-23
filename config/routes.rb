Rails.application.routes.draw do
  resources :subscriptions
  resources :comments
  devise_for :users
  resources :users
  root "events#index"
  get 'search/index'
  get 'search/favorites'
  get 'search' => 'search#index'
  get 'search_event' => 'search#user_events'
  resources :events do
    # Вложенный ресурс комментов
    # Нам понадобится два экшена: create и destroy
    resources :comments, only: [:create, :destroy]
    # вложенный ресурс подписок
    resources :subscriptions, only: [:create, :destroy]
  end

  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Defines the root path route ("/")
  # root "articles#index"
end
