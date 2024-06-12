class UsersController < ApplicationController
  before_action :authenticate_user!, only: [:show]
  before_action :set_user, only: [:show]
  before_action :authorize_user, only: [:show]

  def show
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
end
