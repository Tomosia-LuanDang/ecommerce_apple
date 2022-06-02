Rails.application.routes.draw do
  root to: 'home#index'
  devise_for :users, path_names: { sign_in: 'login', sign_out: 'logout', registration: 'register' }

  namespace :admin do
    resources :dashboard
    resources :users
  end
  resources :home
  resources :products
  resources :carts
  resources :categories
end
