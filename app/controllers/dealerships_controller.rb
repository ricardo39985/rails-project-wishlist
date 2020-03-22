# frozen_string_literal: true

class DealershipsController < ApplicationController
  def index
    check_if_authorized
  end

  def new
    check_if_authorized
  end

  def create
    check_if_authorized
    @deal = @car.dealerships.new(dealer_params)

    if @deal.save
      @deal.cars << @car
      flash[:notice] = 'Dealer Saved'
      redirect_to user_car_dealerships_path(current_user, @car)
    else
      render :new
    end
  end

  private

  def dealer_params
    params.require(:dealership).permit(:name, :location)
  end

  def check_if_authorized
    redirect_if_try_to_spoof
    @car = current_user.cars.find_by(id: params[:car_id])
    @car ? (@deal = @car.dealerships.new) : (redirect_to current_user)
  end
end
