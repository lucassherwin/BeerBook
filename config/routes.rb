Rails.application.routes.draw do
  root 'pages#home'
  resources :locations
  resources :breweries, only: [:index, :show]
  resources :user_beers, only: [:new, :create, :destroy]
  resources :beers
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
  get 'signup', to: 'users#new'
  resources :users, except: [:index, :new]
end
