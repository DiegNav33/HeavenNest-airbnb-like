class BookingsController < ApplicationController

  def new
    @advert = Advert.find(params[:advert_id])
    @booking = Booking.new(advert_id: @advert.id)
  end

  def create
    @advert = Advert.find(params[:advert_id])
    @booking = @advert.bookings.new(booking_params)
    @booking.user = current_user
    if @booking.save
      redirect_to profile_path(current_user), status: :see_other
    else
      render :new, status: :unprocessable_entity
    end
  end

  def destroy
  end

  private

  def booking_params
    params.require(:booking).permit(:start_date, :end_date, :total_guests)
  end
end
