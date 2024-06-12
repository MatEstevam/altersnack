class OrdersController < ApplicationController
  before_action :authenticate_user!

  def create
    @product = Product.find(params[:product_id])
    @order = Order.new(product: @product, user: current_user)

    if @order.save
      redirect_to restaurant_path(@product.user), notice: 'Compra realizada com sucesso!'
    else
      redirect_to product_path(@product), alert: 'Erro ao realizar a compra.'
    end
  end
end
