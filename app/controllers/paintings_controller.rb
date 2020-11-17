class PaintingsController < ApplicationController

  def new
    @painting = Painting.new
  end

  def create
    @painting = Painting.new(painting_params)
    if @painting.save
      redirect_to painting_path(@painting)
    else
      render :new
    end
    
  def index
    @paintings = Painting.all
  end

  def show
    @painting = Painting.new
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

  private

  def painting_params
    params.require(:painting).permit(:name, :price, :description, :user_id)
  end
end
