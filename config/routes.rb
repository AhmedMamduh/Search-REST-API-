Rails.application.routes.draw do
	namespace 'api' do
		namespace 'v1' do
		  resources :products
		  root 'products#index'
		  get '/product/', to: 'products#search_by_product_name'
		end
	end
end
