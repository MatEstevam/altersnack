class ProductsController < ApplicationController
  before_action :set_product, only: %i[show edit update destroy]

  def new
    @product = Product.new
    authorize @product
  end

  def show
  end

  def create

  end

  def edit
    @product = Product.find(params[:id])
  end

  # private

  def set_product
     @product = Product.find(params[:id])
     authorize @product
   end

  # def product_params
  #   params.require(:user).permit(:name, :address, :email, :password)
  # end

end
