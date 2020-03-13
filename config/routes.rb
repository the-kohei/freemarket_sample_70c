Rails.application.routes.draw do
  devise_for :users, controllers: {
    registrations: 'users/registrations',
  }
  root  "tops#index"
  resources :tops, only: [:show]
  resources :user_adresses, only: [:index,:new,:create]
  resources :tests, only: [:index, :show]
end
