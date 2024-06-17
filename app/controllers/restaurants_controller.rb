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
      if params[:filter].present?
        case params[:filter]
        when "gluten_free"
          @users = @users.joins(products: :product_restrictions)
          .where(product_restrictions: { restriction_id: Restriction.find_by(name: "Gluten Free").id })
          .distinct
        when "dairy_free"
          @users = @users.joins(products: :product_restrictions)
          .where(product_restrictions: { restriction_id: Restriction.find_by(name: "Dairy Free").id })
          .distinct
        when "nut_free"
          @users = @users.joins(products: :product_restrictions)
          .where(product_restrictions: { restriction_id: Restriction.find_by(name: "Nut Free").id })
          .distinct
        when "soy_free"
          @users = @users.joins(products: :product_restrictions)
          .where(product_restrictions: { restriction_id: Restriction.find_by(name: "Soy Free").id })
          .distinct
        when "vegetarian"
          @users = @users.joins(products: :product_restrictions)
          .where(product_restrictions: { restriction_id: Restriction.find_by(name: "Vegetarian").id })
          .distinct
        when "vegan"
          @users = @users.joins(products: :product_restrictions)
          .where(product_restrictions: { restriction_id: Restriction.find_by(name: "Vegan").id })
          .distinct
        else
          @restaurants = Restaurant.all
        end
      end
    else
      redirect_to new_user_session_path
    end
  end

  def show
    @products = @user.products
    @orders = Order.where(product_id: @products.ids)
  end

  private

  def set_restaurant
    @user = User.find(params[:id])
    authorize @user
  end

  def restaurant_params
    params.require(:user).permit(:photo)
  end
end
