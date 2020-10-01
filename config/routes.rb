Rails.application.routes.draw do
  devise_for :users
  # root to: 'pages#home'
  #(retiramos essa root e criamos a root bases#index - Fabi e Gabi - 30/09)
  # Voltei a root para home - Rafael
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html

  resources :bases

  resources :orders, only: [:index, :show]

  resources :orders do
    resources :items, only: [:destroy]
  end

  get "/conclude/:id", to: "orders#conclude", as: :conclude_order
  get "/cancel/:id", to: "orders#cancel", as: :cancel_order

  root to: 'pages#home'
end
