class PaintingsController < ApplicationController
  before_action :authenticate_user!, except: :index

  def new
    @painting = Painting.new
  end

  def create
    @painting = Painting.new(painting_params)
    @painting.user = current_user
    if @painting.save
      redirect_to dashboard_path, notice: 'Your painting has been listed for rent!'
    else
      render :new
    end
  end

  def index
    @paintings = Painting.all
       @markers = @paintings.geocoded.map do |painting|
      {
        lat: painting.latitude,
        lng: painting.longitude,
        infoWindow: render_to_string(partial: "info_window", locals: { painting: painting })
      }
    end
  end

  def show
    @painting = Painting.find(params[:id])
    @booking = Booking.new
    @bookings = @painting.bookings
    @user = @painting.user
  end

  def edit
    @painting = Painting.find(params[:id])
  end

  def update
    @painting = Painting.find(params[:id])
    if @painting.update(painting_params)
      redirect_to painting_path(@painting), notice: 'Your painting is beautiful and ready to be displayed'
    else
      render :edit
    end
  end

  def destroy
    @painting = Painting.find(params[:id])
    @painting.destroy
    flash[:notice] = "Your painting has been destroy"
    redirect_to dashboard_path
  end

  private

  def painting_params
    params.require(:painting).permit(:name, :artist, :price, :address, :description, :photo)
  end
end
