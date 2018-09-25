Rails.application.routes.draw do
  resources :categories
  resources :articles
  resources :media
  resources :admin_users
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
