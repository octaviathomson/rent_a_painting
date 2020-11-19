class BookingsController < ApplicationController

  def edit
    @booking = Booking.find(params[:id])
  end

  def update
    @booking = Booking.find(params[:id])
    if @booking.update(booking_params)
      redirect_to @booking, notice: 'Your booking has been updated!'
    else
      render :edit
    end
  end

  def destroy
    @booking = Booking.find(params[:id])
    @booking.destroy
    redirect_to dashboard_path, notice: "Your booking has been cancelled "
  end

  def new
    @booking = Booking.new
    @painting = Painting.find(params[:painting_id])
  end

  def show
    @booking = Booking.find(params[:id])
    @painting = @booking.painting
    @user = @painting.user
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
    params.require(:booking).permit(:start_date, :end_date, :status)
  end
end
