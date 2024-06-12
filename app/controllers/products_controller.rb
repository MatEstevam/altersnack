class ProductsController < ApplicationController
  before_action :set_product, only: %i[show edit update destroy buy]

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
    if params[:product][:photo].present?
      @product.photo.attach(params[:product][:photo])
    end
    if @product.update(product_params.except(:photo, :restrictions))
      redirect_to products_path, notice: 'product was successfully updated.', status: :see_other
    else
      render :edit, status: :unprocessable_entity
    end
  end

  def buy
    @order = Order.new(product: @product, user: current_user)
    if @order.save
      redirect_to restaurant_path(@product.user), notice: 'Compra realizada com sucesso!'
    else
      redirect_to product_path(@product), alert: 'Erro ao realizar a compra.'
    end
  end

  private

  def set_product
    @product = Product.find(params[:id])
    authorize @product
  end

  def product_params
    params.require(:product).permit(:name, :price, :photo, :description, restriction_ids: [])
  end
end
