class PagesController < ApplicationController
  skip_before_action :authenticate_user!, only: [:home]
  before_action :set_restaurant, only: %i[show edit update destroy]

  def home
    @restaurants = User.where(restaurant: true)
  end

  def show; end

  def new
    @restaurant = User.new
  end

  def edit; end

  def create
    @restaurant = User.new(restaurant_params)
    @restaurant.restaurant = true

    if @restaurant.save
      redirect_to @restaurant, notice: 'Restaurant was successfully created.'
    else
      render :new, status: :unprocessable_entity
    end
  end

  def update
    if @restaurant.update(restaurant_params)
      redirect_to @restaurant, notice: 'Restaurant was successfully updated.', status: :see_other
    else
      render :edit, status: :unprocessable_entity
    end
  end

  def destroy
    @restaurant.destroy!
    redirect_to root_path, notice: 'Restaurant was successfully destroyed.', status: :see_other
  end

  private

  def set_restaurant
    @restaurant = User.find(params[:id])
  end

  def restaurant_params
    params.require(:user).permit(:name, :address, :email, :password)
  end
end
