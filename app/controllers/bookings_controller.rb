class BookingsController < ApplicationController
  def create
    @cat = Cat.find(params[:cat_id])
    @booking = @cat.bookings.new(booking_params)
    @booking.user = current_user
    @booking.status = :pending

    if @booking.save
      flash[:notice] = "Your reservation request for #{@cat.name} has been successfully sent!"
      redirect_to @cat
    else
      render :new
    end
  end

  def accept
    @booking = Booking.find(params[:id])
    @user = @booking.user
    @booking.accepted!
    redirect_to dashboard_path, notice: 'Booking accepted successfully.'
  end

  def decline
    @booking = Booking.find(params[:id])
    @booking.declined!
    redirect_to dashboard_path, notice: 'Booking declined successfully.'
  end

  private

  def booking_params
    params.require(:booking).permit(:start_date, :end_date, :message)
  end
end
