Rails.application.routes.draw do
  root 'articles#index'
  get '/categories', to: 'fixed_pages#category'
  get '/profile', to: 'fixed_pages#profile'
  resources :articles, only: [:index, :show]

  resources :admin_users do
    resources :new_article, only: [:index, :create]
    resources :articles, only: [:index], controller: 'admin_article'
    get '/articles/:article_id', to: 'admin_article#show'
    post '/articles/:article_id', to: 'admin_article#edit'

    get '/media/upload', to: 'media#index_upload'
    post '/media/upload', to: 'media#create_upload'
    resources :media, only: [:index, :destroy]
  end

  get '/login', to: 'sessions#index'
  post '/login', to: 'sessions#create'
  delete '/login', to: 'sessions#destroy'
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
