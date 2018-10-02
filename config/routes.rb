Rails.application.routes.draw do
  root 'articles#index'
  devise_for :admin_users
  resources :categories
  resources :articles, only: [:index]
  resources :media
  resources :admin_users
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
