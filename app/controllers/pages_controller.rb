class PagesController < ApplicationController
  skip_before_action :authenticate_user!, only: [ :home ]
  before_action :set_restaurant, only: %i[show edit update destroy chef]

  def home
    @restaurants = User.where(restaurant: true)
  end

  # GET /restaurants/1
  def show; end

  # GET /restaurants/new
  def new
    @restaurant = User.new
  end

  # GET /restaurants/1/edit
  def edit; end

  # POST /restaurants
  def create
    @restaurant = User.new(restaurant_params)
    @restaurant.restaurant = true

    if @restaurant.save
      redirect_to @restaurant, notice: 'Restaurant was successfully created.'
    else
      render :new, status: :unprocessable_entity
    end
  end

  # PATCH/PUT /restaurants/1
  def update
    if @restaurant.update(restaurant_params)
      redirect_to @restaurant, notice: 'Restaurant was successfully updated.', status: :see_other
    else
      render :edit, status: :unprocessable_entity
    end
  end

  # DELETE /restaurants/1
  def destroy
    @restaurant.destroy!
    redirect_to root_path, notice: 'Restaurant was successfully destroyed.', status: :see_other
  end


  private

  # Use callbacks to share common setup or constraints between actions.
  def set_restaurant
    @restaurant = User.find(params[:id])
  end

  # Only allow a list of trusted parameters through.
  def restaurant_params
    params.require(:restaurant).permit(:name, :address, :email, :restaurant)
  end
end
