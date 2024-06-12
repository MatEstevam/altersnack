class RestaurantsController < ApplicationController
  skip_before_action :authenticate_user!, only: [:index]
  before_action :set_restaurant, only: [:show]

  def index
    @users = policy_scope(User)
    if user_signed_in?
      if current_user.restaurant?
        redirect_to restaurant_path(current_user)
        return
      end
    else
      redirect_to new_user_session_path
    end
  end

  def show
    @products = @user.products
  end

  private

  def set_restaurant
    @user = User.find(params[:id])
    authorize @user
  end

end
