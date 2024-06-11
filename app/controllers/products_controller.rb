class ProductsController < ApplicationController
  before_action :set_product, only: %i[show edit update destroy]

  def new
    @product = Product.new
    authorize @product
  end
<<<<<<< HEAD

  def show
  end

  def create
=======
>>>>>>> master

  def create
    @product = Product.new(product_params)
    @product.user = current_user
    authorize @product
    if @product.save
      redirect_to restaurant_path(current_user)
    else
      render :new
    end
  end

  def edit
    @product = Product.find(params[:id])
  end

  private

  def set_product
     @product = Product.find(params[:id])
     authorize @product
   end

  def product_params
   params.require(:product).permit(:name, :price, :description, :restrictions, :photo)
  end

end
