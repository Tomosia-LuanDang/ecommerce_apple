Rails.application.routes.draw do
  root 'static_pages#home'
  get 'static_pages/help'
  get 'static_pages/about'
  get 'static_pages/contact'
  namespace :admin do
    resources :dashboard
    resources :users

  end
  resources :products
  resources :carts
end
