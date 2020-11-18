class BookingsController < ApplicationController


  def edit
  end

  def destroy
    @booking.destroy(booking_params)
    redirect_to @booking, notice: "Your booking has been cancelled "
  end

  def new
    @booking = Booking.new
    @painting = Painting.find(params[:painting_id])
  end

  def create
    @booking = Booking.new(booking_params)
    @booking.user = current_user
    @painting = Painting.find(params[:painting_id])
    @booking.painting = @painting
    if @booking.save
      redirect_to booking_path(@booking)
    else
      render :new
    end
  end

    private

  def booking_params
    params.require(:booking).permit(:start_date, :end_date)

  end
end
