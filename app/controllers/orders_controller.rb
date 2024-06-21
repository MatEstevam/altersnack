class OrdersController < ApplicationController
  before_action :authenticate_user!
  before_action :set_cart, only: [:new, :create]

  def new
    @order = Order.new
    authorize @order
  end

  def create
    cart = Cart.find(params[:order][:cart_id])
    order  = Order.create!(cart: cart, amount: cart.total_price, state: 'pending', user: current_user)
    authorize order

    session = Stripe::Checkout::Session.create(
      payment_method_types: ['card'],
      line_items: [{
        price_data: {
          currency: 'usd',
          unit_amount: (cart.total_price * 100).to_i,
          product_data: {
            name: "Order test"
          },
        },

        quantity: 1
      }],
      mode: "payment",
      success_url: order_url(order),
      cancel_url: order_url(order)
    )

    order.update(checkout_session_id: session.id)
    redirect_to new_order_payment_path(order)
  end

  def show
    @order = current_user.orders.find(params[:id])
    authorize @order
    @order.cart.destroy if @order.cart.present?
  end

  private

  def set_cart
    @cart = current_user.cart
  end
end
