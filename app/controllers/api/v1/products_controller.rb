module Api
	module V1
		class ProductsController < ApplicationController
		  before_action :set_product, only: [:show, :update, :destroy]

		  # GET api/v1/products
		  def index
		    @products = Product.all

		    render json: @products
		  end

		  # GET api/v1/product?query=ProductName
		  def search_by_product_name
		    @results = Product.text_search(params[:query])
		    if @results.empty?
		    	render json: { status: "FAILED", message: "No product found"}
		    else
		    	render json: { status: "SUCCESS", data: @results}, status: :ok
			end
		  end

		  # GET api/v1/products/1
		  def show
		    render json: @product
		  end

		  # POST api/v1/products
		  def create
		    @product = Product.new(product_params)

		    if @product.save
		      render json: @product, status: :created, location: @product
		    else
		      render json: @product.errors, status: :unprocessable_entity
		    end
		  end

		  # PATCH/PUT api/v1/products/1
		  def update
		    if @product.update(product_params)
		      render json: @product
		    else
		      render json: @product.errors, status: :unprocessable_entity
		    end
		  end

		  # DELETE api/v1/products/1
		  def destroy
		    @product.destroy
		  end

		  private
		    # Use callbacks to share common setup or constraints between actions.
		    def set_product
		      @product = Product.find(params[:id])
		    end

		    # Only allow a trusted parameter "white list" through.
		    def product_params
		      params.require(:product).permit(:product_name)
		    end
		end

	end
end