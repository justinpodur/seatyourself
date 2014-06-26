class ReservationsController < ApplicationController
	before_action :load_restaurant

  def show
  	@reservation = Reservation.find(params[:id])
  end

  def create
  	@reservation = @restaurant.reservations.build(reservation_params)
  	@reservation.user_id = current_user.id
  
  	if @reservation.save
  		redirect_to restaurants_path, notice: "Your reservation is booked"
  	else
  		render 'restaurants/show'
  	end
  end

  def destroy
  	@reservation = Reservation.find(params[:id])
  	@reservation.destroy
  end
  
  private

  def reservation_params
  	params.require(:reservation).permit(:party_time, :party_size)
  end

  def load_restaurant
  	@restaurant = Restaurant.find(params[:restaurant_id])
  end

end
