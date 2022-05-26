Rails.application.routes.draw do
  root 'static_pages#home'
  get 'static_pages/help'
  get 'static_pages/about'
  get 'static_pages/contact'
  namespace :admin do
    resources :static_pages  #http://localhost:3000/admin/static_pages
  end
end
