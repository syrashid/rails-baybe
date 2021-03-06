Rails.application.routes.draw do
  devise_for :users
  root to: 'categories#index'
  get 'home', to: 'pages#home', as: :home
  resources :products, only: [ :index, :show, :create, :new, :edit, :update ]
  get 'products/:id/added', to: 'products#add_to_cart', as: :add_to_cart
  resources :categories, only: [ :index, :show]

  resources :sell_products, only: [ :index, :show, :new, :create]
  get 'sell_products/:id/added', to: 'sell_products#add_to_box', as: :add_product
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

  get 'filtercategory', to: 'products#filter_category', as: :filt_cat
  get 'filtercondition', to: 'products#filter_condition', as: :filt_con
  get 'sell_filter_category', to: 'sell_products#filter_category', as: :sell_filt_cat
end
