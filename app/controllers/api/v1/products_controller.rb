class Api::V1::ProductsController < ApplicationController
  protect_from_forgery with: :null_session
  def index
    @products = Product.all
  end

  def new
    @product = Product.new
  end

  def create
    @product = Product.create(product_params)
  end

  def edit
    @product = Product.find(params[:id])
  end

  def update
    product = Product.find(params[:id])
    if product.update(product_params)
      render json: product
    else
      render json: { errors: product.errors }, status: 422
    end
  end

  def destroy
    product = Product.find(params[:id])
    product.destroy
    
    head :no_content
  end

  private
  def product_params
    params.require(:product).permit(:name, :price)
  end
end