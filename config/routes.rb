Rails.application.routes.draw do
  root to: 'home#index'
  devise_for :users, controllers: {
    registrations: 'users/registrations',
    sessions:      'users/sessions'
  }

  namespace :admin do
    resources :dashboard
    resources :users
  end
  resources :home
  resources :products
  resources :carts
  resources :categories
end
