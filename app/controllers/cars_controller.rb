# frozen_string_literal: true

class CarsController < ApplicationController
  def new
    redirect_if_try_to_spoof
    @car = Car.new
  end

  def create
    redirect_if_try_to_spoof
    @car = Car.new(car_params)
    @car.save ? (redirect_to user_car_path(current_user, @car)) : (render :new)
  end

  def index
    redirect_if_try_to_spoof
  end

  private

  def find_car_or_redirect
    return unless user_signed_in?

    @car = current_user.cars.find_by(id: params[:id])
    return if @car

    flash[:notice] = 'You do not have permission to do that'
    redirect_to current_user
  end

  def car_params
    params.require(:car).permit(:model, :manufacturer_id, :year, :user_id)
  end
end
