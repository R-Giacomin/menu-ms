Rails.application.routes.draw do
  mount RailsAdmin::Engine => '/admin', as: 'rails_admin'
  devise_for :users
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html

  resources :bases do
    collection do
      get 'autocomplete'
    end
    resources :items, only: [:create]
  end

  resources :orders, only: [:index, :show, :create]

  resources :items, only: [:destroy]


  get "/conclude_order/:id", to: "orders#conclude_order", as: :conclude_order
  get "/cancel_order/:id", to: "orders#cancel_order", as: :cancel_order
  get "/items/:id", to: "items#destroy", as: :delete_item
  get "/create_order/:id", to: "orders#create", as: :create_order

  root to: 'pages#home'
end
