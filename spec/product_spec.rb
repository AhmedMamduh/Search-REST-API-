require 'rails_helper'

RSpec.describe 'Products requests', :type => :request do 

	#list of all products
	describe 'GET /products' do 
		it 'returns a list of products' do 
			get('/api/v1/products')
			json = JSON.parse(response.body)
			expect(json['status']).to eql('SUCCESS')
		end
	end

	before do
		@product = Product.create!(product_name: "test")
	end

	#search by product name success
	describe 'Search by product name success' do
		it 'return product data' do
			get('/api/v1/product?query=test')
			json = JSON.parse(response.body)
			expect(json['status']).to eql('SUCCESS')
		end
	end

	#search by product name failed
	describe 'Search by product name failed' do 
		it 'return message product not found' do 
			get('/api/v1/product?query=test2')
			json = JSON.parse(response.body)
			expect(json['status']).to eql('FAILED')
		end
	end

	#empty search params
	describe 'empty search error' do 
		it 'return message' do 
			get('/api/v1/product/')
			json = JSON.parse(response.body)
			expect(json['message']).to eql('Search by prodcut name using api/v1/product?query=ProductName')
		end
	end

end