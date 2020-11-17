class BookingsController < ApplicationController

  def edit
  end

  def destroy
    @booking.destroy(booking_params)
    redirect_to @booking, notice: "Your booking has been cancelled "
  end
end
