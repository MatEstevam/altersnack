class OrdersController < ApplicationController
  before_action :authenticate_user!

  def new
    @order = Order.new
  end

  def create
    @order = Order.new(user: current_user)
    current_user.cart.cart_items.each do |item|
      @order.order_items.build(product: item.product, quantity: item.quantity, price: item.product.price)
    end

    if @order.save
      current_user.cart.cart_items.destroy_all
      redirect_to @order, notice: 'Pedido realizado com sucesso!'
    else
      render :new
    end
  end

  def show
    @order = Order.find(params[:id])
  end
end
