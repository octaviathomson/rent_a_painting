class PagesController < ApplicationController
  before_action :authenticate_user!, except: :home

  def home
  end

  def dashboard
    @user = current_user
    @user_painting = @user.paintings
    @bookings = @user.bookings
    @paintings = @user.paintings
    @incoming_bookings = @user.incoming_bookings
  end
end
