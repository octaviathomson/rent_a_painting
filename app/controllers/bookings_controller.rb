class BookingsController < ApplicationController


  def edit
  end

  def destroy
    @booking.destroy(booking_params)
    redirect_to @booking, notice: "Your booking has been cancelled "
  end

  def new
    @booking = Booking.new
  end

  def create
    @booking = booking.new(booking_params)
    if @booking.save
      redirect_to booking_path(@booking)
    else
      render :new
    end
  end

    private

  def booking_params
    params.require(:painting).permit(:start_date, :end_date, :painting_id, :user_id)

  end
end
