Rails.application.routes.draw do
  # get 'articles/index' - same as bellow
  # get 'users/index'
  # post 'orders/create'
  # post '/orders', to: 'orders#create'
  get '/articles', to: 'articles#index'
  get '/articles/:id', to: 'articles#show', as: :article

  root to: 'articles#index'
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
