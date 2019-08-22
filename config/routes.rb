Rails.application.routes.draw do
  devise_for :users
  root to: 'categories#index'
  get 'home', to: 'pages#home', as: :home
  resources :products, only: [ :index, :show ]
  resources :categories, only: [ :index, :show]

  resources :carts, only: [ :index, :show ] do
    member do
      get 'current'
    end
  end

  resources :boxes, only: [ :index, :show, :destroy ] do
    member do
      patch "confirm"
    end
  end

  resources :stock_products, only: :destroy
end
