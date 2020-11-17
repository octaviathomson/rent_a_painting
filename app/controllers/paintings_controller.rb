class PaintingsController < ApplicationController

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

  def destroy
    @painting.destroy(painting_params)
    redirect_to @painting, notice: 'Your painting has been destroy'
  end

  private

  def painting_params
    params.require(:painting).permit(:name, :price, :description, :user_id)
  end
end
