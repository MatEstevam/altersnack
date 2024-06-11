class ProductsController < ApplicationController
  #before_action :set_product, only: %i[new edit update destroy]

  def new
    @product = Product.new
    authorize @product
  end
  
  def create

  end

  def edit
    @product = Product.find(params[:id])
  end

  # private

  # def set_product
  #   @product = User.find(params[:id])
  # end

  # def product_params
  #   params.require(:user).permit(:name, :address, :email, :password)
  # end

end
