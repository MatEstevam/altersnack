class OrdersController < ApplicationController
  before_action :authenticate_user!
  before_action :set_cart, only: [:new, :create]

  def new
    @order = Order.new
    authorize @order
  end

  def create
    authorize Order

    delivery_fee = @cart.cart_items.first.product.user.delivery_fee || 0
    total_price = @cart.total_price + delivery_fee

    @cart.cart_items.each do |item|
      @order = Order.new(
        user: current_user,
        cart_item: item,
        quantity: item.quantity,
        price: item.product.price
      )
      authorize @order

      unless @order.save
        render :new and return
      end
    end

    if current_user.cart.cart_items.destroy_all
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
