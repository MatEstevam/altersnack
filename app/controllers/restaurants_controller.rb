class RestaurantsController < ApplicationController
  skip_before_action :authenticate_user!, only: [:index]
  before_action :set_restaurant, only: %i[show]

  def index
    @restaurants = User.where(restaurant: true)
    policy_scope(@restaurants)
  end

  def show
    @restaurant = User.find(params[:id])
    @products = @restaurant.products
  end

  private

  def set_restaurant
    @restaurant = User.find(params[:id])
    authorize @restaurant
  end

end
