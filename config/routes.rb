Rails.application.routes.draw do
  root to: 'home#index'
  namespace :admin do
    resources :dashboard
    resources :users
  end
  resources :home
  resources :products
  resources :carts
  resources :categories
end
