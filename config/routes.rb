Rails.application.routes.draw do
  devise_for :users
  root to: 'categories#index'
  get 'home', to: 'pages#home', as: :home
  resources :products, only: [ :index, :show ]
  resources :categories, only: [ :index, :show]

  resources :carts, only: [ :index ]
  resources :sell_products, only: [ :index, :show ]

  get 'sell_products/:id/added', to: 'sell_products#addToBox', as: :add_product

end
