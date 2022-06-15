Rails.application.routes.draw do
  root to: 'home#index'
  devise_for :users, path_names: { sign_in: 'login', sign_out: 'logout', registration: 'register' }

  namespace :admin do
    resources :dashboard,   only: [:index]
    resources :users,       only: [:index, :show]
    resources :categories,  only: [:index]
    resources :products,    only: [:index, :destroy]
    resources :orders,      only: [:index]
  end
  resources :home,       only: [:index]
  resources :carts,      only: [:index]
  resources :categories, only: [:index, :show]
  resources :products,   only: [:index, :show]
  resources :cart_items, only: [:create, :update, :destroy]
  resources :orders,     only: [:new, :create]
  get "*path", to: "application#page_404"
end
