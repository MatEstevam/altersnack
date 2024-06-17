class OrdersController < ApplicationController
  before_action :authenticate_user!
  before_action :set_cart, only: [:new, :create]

  def new
    @order = Order.new
    authorize @order
  end

  def create
    if @cart.cart_items.empty?
      redirect_to root_path, alert: 'Your cart is empty.'
      return
    end

    @cart.cart_items.each do |item|
      order = Order.new(
        user: current_user,
        product: item.product,
        quantity: item.quantity,
        price: item.product.price
      )
      authorize order

      if order.save
        item.destroy
      else
        Rails.logger.debug "Order errors: #{order.errors.full_messages}"
        render :new, alert: 'Failed to place order.'
        return
      end
    end

    redirect_to root_path, notice: 'Order placed successfully!'
  end

  def show
    @order = Order.find(params[:id])
    authorize @order
  end

  private

  def set_cart
    @cart = current_user.cart || current_user.create_cart
  end
end
