Rails.application.routes.draw do
  devise_for :users
  root to: 'categories#index'
  get 'home', to: 'pages#home', as: :home
  resources :products, only: [ :index, :show ]
  get 'products/:id/added', to: 'products#addToCart', as: :add_to_cart
  resources :categories, only: [ :index, :show]

  resources :sell_products, only: [ :index, :show ]
  get 'sell_products/:id/added', to: 'sell_products#addToBox', as: :add_product

  resources :carts, only: [ :index, :show ] do
    member do
      get 'current'
    end
  end

  resources :boxes, only: [ :index, :show, :destroy ] do
    member do
      patch "confirm"
      get 'current'
    end
  end

  resources :stock_products, only: :destroy

end
