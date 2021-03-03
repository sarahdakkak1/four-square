Rails.application.routes.draw do
  devise_for :users
  root to: 'pages#home'

    resources :businesses, param: :slug do
      resources :reviews, only: [:create, :destroy]
    end
      get '/businesses/search', to: 'businesses#search', as: :search

end
