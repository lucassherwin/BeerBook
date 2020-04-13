Rails.application.routes.draw do
  resources :user_beers
  resources :beers
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
  get 'signup', to: 'users#new'
  resources :users, except: [:index, :new]
end
