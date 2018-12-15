module Api
	module V1
		class ProductsController < ApplicationController
		  before_action :set_product, only: [:show, :update, :destroy]

		  
		  def index
		    @products = Product.all

		    render json: { status: "SUCCESS", data: @products}, status: :ok
		  end

		  
		  def search_by_product_name
		    @results = Product.text_search(params[:query])
		    if @results.nil?
		    	render json: { message: "Search by prodcut name using api/v1/product?query=ProductName"}
		    else
		    	if @results.empty?
		    		render json: { status: "FAILED", message: "No product found"}
		    	else
		    		render json: { status: "SUCCESS", data: @results}, status: :ok
		    	end
			end
		  end

		  
		  def show
		    render json: @product
		  end

		  
		  def create
		    @product = Product.new(product_params)

		    if @product.save
		      render json: { status: "SUCCESS", data: @product}, status: :ok
		    else
		      render json: { status: "ERROR", data: @product.errors}, status: :unprocessable_entity
		    end
		  end

		  
		  def update
		    if @product.update(product_params)
		      render json: { status: "SUCCESS", data: @product}, status: :ok
		    else
		      render json: { status: "ERROR", data: @product.errors}, status: :unprocessable_entity
		    end
		  end

		  
		  def destroy
		    @product.destroy
		    render json: { message: "Product deleted"}
		  end

		  private
		    
		    def set_product
		      @product = Product.find(params[:id])
		    end

		    
		    def product_params
		      params.require(:product).permit(:product_name)
		    end
		end

	end
end
