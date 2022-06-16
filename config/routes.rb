Rails.application.routes.draw do
  root to: 'home#index'
  devise_for :users, path_names: { sign_in: 'login', sign_out: 'logout', registration: 'register' }

  namespace :admin do
    resources :dashboard,   only: [:index]
    resources :users,       only: [:index, :show]
    resources :categories,  only: [:index, :destroy, :edit, :update]
    resources :products,    only: [:index, :destroy, :edit, :update, :new, :create]
    resources :orders,      only: [:index]
  end
  resources :home,             only: [:index]
  resources :carts,            only: [:index]
  resources :categories,       only: [:show]
  resources :products,         only: [:index, :show]
  resources :cart_items,       only: [:create, :update, :destroy]
  resources :orders,           only: [:new, :create]
  resources :users,            only: [:show, :update]
  resources :addresses,        only: [:new, :create]
  get "*path", to: "application#page_404"
end
