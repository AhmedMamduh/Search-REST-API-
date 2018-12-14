Rails.application.routes.draw do
  resources :products
  root 'products#index'
  get '/product/', to: 'products#search_by_product_name'

end
