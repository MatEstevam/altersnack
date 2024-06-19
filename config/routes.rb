Rails.application.routes.draw do
  get 'carts/show'
  get 'orders/create'
  devise_for :users, controllers: { registrations: 'users/registrations' }

  # Definir a página inicial
  root to: "restaurants#index"

  # Rotas para restaurantes usando PagesController
  resources :users, only: [:show]
  resources :restaurants
  resources :products do
    post 'add_to_cart', on: :member, to: 'carts#add_product'
  end


  resource :cart, only: [:show] do
    member do
      patch 'update_quantity/:id', to: 'carts#update_quantity', as: 'update_quantity'
      delete 'remove_from_cart/:id', to: 'carts#remove_from_cart', as: 'remove_from_cart'
    end
  end


  mount StripeEvent::Engine, at: '/stripe-webhooks'

  resources :orders, only: [:new, :create, :show] do
    resources :payments, only: :new
  end

  # Reveal health status on /up that returns 200 if the app boots with no exceptions, otherwise 500.
  # Can be used by load balancers and uptime monitors to verify that the app is live.
  get "up" => "rails/health#show", as: :rails_health_check

  # Defines the root path route ("/")
  # root "posts#index"

  resources :recipes

end
