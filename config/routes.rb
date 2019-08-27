Rails.application.routes.draw do
  devise_for :users
  root to: 'categories#index'
  get 'home', to: 'pages#home', as: :home
  resources :products, only: [ :index, :show, :create, :new, :edit, :update ]
  get 'products/:id/added', to: 'products#addToCart', as: :add_to_cart
  resources :categories, only: [ :index, :show]

  resources :sell_products, only: [ :index, :show, :new, :create]
  get 'sell_products/:id/added', to: 'sell_products#addToBox', as: :add_product
  get 'review_products', to: "products#review_products"

  resources :carts, only: [ :index, :show, :destroy ] do
    member do
      patch "confirm"
      get 'current'
    end
    resources :payments, only: [:new, :create]
  end

  resources :boxes, only: [ :index, :show, :destroy ] do
    member do
      patch "confirm"
      get 'current'
    end
  end

  resources :stock_products, only: :destroy

end
