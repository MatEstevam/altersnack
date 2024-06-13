class ProductsController < ApplicationController
  before_action :set_product, only: %i[show edit update destroy]

  def new
    @product = Product.new
    authorize @product
  end

  def show
  end

  def edit
  end

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

  def update
    if params[:product][:photos].present?
      @product.photos.attach(params[:product][:photos])
    end
    if @product.update(product_params.except(:photos))
      redirect_to products_path, notice: 'Product was successfully updated.', status: :see_other
    else
      render :edit, status: :unprocessable_entity
    end
  end

  private

  def set_product
    @product = Product.find(params[:id])
    authorize @product
  end

  def product_params
    params.require(:product).permit(:name, :price, :description, restriction_ids: [], photos: [])
  end
end
