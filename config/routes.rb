Rails.application.routes.draw do
  devise_for :users
  # root to: 'pages#home'
  #(retiramos essa root e criamos a root bases#index - Fabi e Gabi - 30/09)
  # Voltei a root para home - Rafael
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html

  resources :bases

  root to: 'pages#home'
end
