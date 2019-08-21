Rails.application.routes.draw do
  get 'carts/show'
  get 'categories/index'
  devise_for :users
  root to: 'pages#home'
  get 'carts/:id' => "carts#show", as: "cart"
  delete 'carts/:id' => "carts#destroy"

  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  resources :products, only: [ :index ]
  resources :carts, only: [ :index ]
end
