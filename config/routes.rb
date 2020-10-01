Rails.application.routes.draw do
  devise_for :users
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html

  resources :bases do
    resources :items, only: [:create]
  end

  resources :orders, only: [:index, :show, :create]

  resources :orders do
    resources :items, only: [:destroy]
  end

  get "/conclude/:id", to: "orders#conclude", as: :conclude_order
  get "/cancel/:id", to: "orders#cancel", as: :cancel_order

  root to: 'pages#home'
end
