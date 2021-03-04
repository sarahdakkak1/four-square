Rails.application.routes.draw do
  devise_for :users
  root to: 'businesses#home'
  get '/businesses/search', to: 'businesses#search', as: :search

  resources :businesses, param: :slug do
    resources :reviews, only: [:create, :destroy]
  end

end
