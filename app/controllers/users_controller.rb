class UsersController < ApplicationController
  before_action :set_user, only: :show
  before_action :authorize_user, only: :show

  def show
    if @user.restaurant?
      @orders = Order.joins(cart: { cart_items: :product }).where(products: { user_id: @user.id })
    else
      @orders = @user.orders.includes(cart: { cart_items: :product })
    end
  end

  private

  def set_user
    @user = User.find(params[:id])
  end

  def authorize_user
    authorize @user
  end
end
