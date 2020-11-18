class PagesController < ApplicationController
  before_action :authenticate_user!, except: :home

  def home
  end

  def dashboard
    @user = current_user
    @bookings = @user.bookings
    @paintings = @user.paintings
    @incoming_bookings = @user.incoming_bookings
  end
end
