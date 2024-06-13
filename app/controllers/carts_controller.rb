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
    @cart_item.quantity = (@cart_item.quantity || 0) + quantity
    if @cart_item.save
      redirect_to restaurant_path(product.user), notice: 'Produto adicionado ao carrinho.'
    else
      redirect_to product_path(product), alert: 'Não foi possível adicionar o produto ao carrinho.'
    end
  end

  def remove_product
    authorize @cart, :remove_product?
    @cart_item = @cart.cart_items.find(params[:id])
    @cart_item.destroy
    redirect_to cart_path, notice: 'Produto removido do carrinho.'
  end

  private

  def set_cart
    @cart = current_user.cart || Cart.create(user: current_user)
  end
end
