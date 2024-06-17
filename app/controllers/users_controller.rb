class UsersController < ApplicationController
  before_action :authenticate_user!, only: [:show]
  before_action :set_user, only: [:show]
  before_action :authorize_user, only: [:show]

  def show
    @user = User.find(params[:id])
    if @user.restaurant
      @orders = Order.joins(:product).where(products: { user_id: @user.id })
    else
      @orders = @user.orders.includes(:product)
    end
    authorize @user
  end

  private

  def set_user
    @user = User.find(params[:id])
    redirect_to root_path, alert: 'User not found' unless @user
  end

  def authorize_user
    redirect_to root_path, alert: 'Not authorized' unless current_user == @user
  end

  def user_params
    params.require(:user).permit(:name, :email, :photo, :address)
  end
end
