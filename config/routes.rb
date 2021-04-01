Rails.application.routes.draw do

  get 'messages/new'
  devise_for :users
  root to: 'items#index'
  resources :items do
    resources :buy_items, only: [:index, :create]
    resources :messages, only: [:create]
  end
  
end
