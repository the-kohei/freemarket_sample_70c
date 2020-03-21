Rails.application.routes.draw do
  get 'purchase/index'
  get 'purchase/done'
  get 'credit_cards/index'
  devise_for :users, controllers: {
    registrations: 'users/registrations',
  }
  root  "tops#index"
  resources :tops, only: [:index,:show,:new]  
    
  resources :user_adresses, only: [:index,:new,:create]
  resources :tests, only: [:show]
  resources :credit_cards, only: [:index, :new, :show,:delete] do
    collection do
      post 'show', to: 'credit_cards#show'
      post 'pay', to: 'credit_cards#pay'
      post 'delete', to: 'credit_cards#delete'
    end
  end
  resources :products do
  resources :purchase, only: [:index] do
    collection do
      get 'index', to: 'purchase#index'
      post 'pay', to: 'purchase#pay'
      get 'done', to: 'purchase#done'
    end
  end
end

end
