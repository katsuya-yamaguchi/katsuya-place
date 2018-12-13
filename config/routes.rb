Rails.application.routes.draw do
  root 'articles#index'
  resources :categories
  resources :articles, only: [:index, :show]

  resources :admin_users do
    resources :new_article, only: [:index, :create]
    resources :new_fixed_article, only: [:index, :create]
    resources :articles, only: [:index, :show, :create, :patch]
    resources :fixed_article, only: [:index, :show, :create, :update]

    get '/media/upload', to: 'media#index_upload'
    post '/media/upload', to: 'media#create_upload'
    resources :media, only: [:index, :show, :patch, :destroy]
  end
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
