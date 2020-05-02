Rails.application.routes.draw do
  # get 'articles/index' - same as bellow
  # get 'users/index'
  # post 'orders/create'
  # post '/orders', to: 'orders#create'
  get '/articles', to: 'articles#index'
  get '/article/new', to: 'article#show', as: :new_article
  get '/articles/:id', to: 'articles#new', as: :article

  root to: 'articles#index'
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
