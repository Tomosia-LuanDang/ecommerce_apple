Rails.application.routes.draw do
  root 'home#index'
  namespace :admin do
    resources :dashboard
    resources :users
  end
  resources :home
  resources :products
  resources :carts
  resources :categories
end
