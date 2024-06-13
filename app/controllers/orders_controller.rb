class OrdersController < ApplicationController
  before_action :authenticate_user!
  before_action :set_cart, only: [:new, :create]

  def new
    @order = Order.new
    authorize @order
  end

  def create
    @order = Order.new(user: current_user)
    authorize @order
    current_user.cart.cart_items.each do |item|
      @order.order_items.build(product: item.product, quantity: item.quantity, price: item.product.price)
    end

    if @order.save
      current_user.cart.cart_items.destroy_all
      redirect_to root_path, notice: 'Order placed successfully!'
    else
      render :new
    end
  end

  def show
    @order = Order.find(params[:id])
    authorize @order
  end

  private

  def set_cart
    @cart = current_user.cart
  end
end
