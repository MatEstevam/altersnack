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
        # Mapa de filtros para IDs de restrições
        filter_map = {
          "gluten_free" => Restriction.find_by(name: "Gluten Free")&.id,
          "dairy_free" => Restriction.find_by(name: "Dairy Free")&.id,
          "nut_free" => Restriction.find_by(name: "Nut Free")&.id,
          "soy_free" => Restriction.find_by(name: "Soy Free")&.id,
          "vegetarian" => Restriction.find_by(name: "Vegetarian")&.id,
          "vegan" => Restriction.find_by(name: "Vegan")&.id
        }

        if filter_map[params[:filter]]
          @users = @users.joins(products: :product_restrictions)
                         .where(product_restrictions: { restriction_id: filter_map[params[:filter]] })
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
