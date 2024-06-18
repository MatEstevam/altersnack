class OrdersController < ApplicationController
  before_action :authenticate_user!
  before_action :set_cart, only: [:new, :create]

  def new
    @order = Order.new
    authorize @order
  end

  def create
    raise
    product = Product.find(params[:product_id])
    order  = Order.create!(product: product, amount: product.price, state: 'pending', user: current_user)

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

    order.update(checkout_session_id: session.id)
    redirect_to new_order_payment_path(order)
  end

  def show
    @order = current_user.orders.find(params[:id])
  end

  private

  def set_cart
    @cart = current_user.cart
  end
end
