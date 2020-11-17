class PaintingsController < ApplicationController
  before_action :authenticate_user!, except: :index

  def new
    @painting = Painting.new
  end

  def create
    @painting = Painting.new(painting_params)
    @painting.user = current_user
    if @painting.save
      redirect_to painting_path(@painting), notice: 'Your painting has been listed for rent!'
    else
      render :new
    end
  end

  def index
    @paintings = Painting.all
  end

  def show
    @painting = Painting.find(params[:id])
  end

  def edit
  end

  def update
    if @painting.update(painting_params)
      redirect_to @painting, notice: 'Your painting is beautiful and ready to be displayed'
    else
      render :edit
    end
  end

  def destroy
    @painting.destroy(painting_params)
    redirect_to @painting, notice: 'Your painting has been destroy'
  end

  private

  def painting_params
    params.require(:painting).permit(:name, :artist, :price, :description, :user_id)
  end
end
