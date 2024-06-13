class CartsController < ApplicationController
  before_action :authenticate_user!
  before_action :set_cart

  def show
    authorize @cart
  end

  def add_product
    authorize @cart, :add_product?
    product = Product.find(params[:id])
    quantity = params[:quantity].to_i
    @cart_item = @cart.cart_items.find_or_initialize_by(product: product)
    @cart_item.quantity ||= 0
    @cart_item.quantity += quantity
    if @cart_item.save
      redirect_to restaurant_path(product.user), notice: 'Product added to cart.'
    else
      redirect_to product_path(product), alert: 'Unable to add product to cart.'
    end
  end

  def update_quantity
    @cart_item = @cart.cart_items.find(params[:id])
    authorize @cart_item.cart, :update_quantity?
    @cart_item.update(quantity: params[:cart_item][:quantity].to_i)
    respond_to do |format|
      format.html { redirect_to cart_path }
      format.js
    end
  end

  def remove_product
    authorize @cart, :remove_product?
    @cart_item = @cart.cart_items.find(params[:id])
    @cart_item.destroy
    redirect_to cart_path, notice: 'Product removed from cart.'
  end

  private

  def set_cart
    @cart = current_user.cart || Cart.create(user: current_user)
  end
end
