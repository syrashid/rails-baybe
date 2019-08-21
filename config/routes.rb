Rails.application.routes.draw do
  get 'categories/index'
  devise_for :users
  root to: 'pages#home'
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  resources :products, only: [ :index ]
  resources :categories, only: [ :index ]
end
