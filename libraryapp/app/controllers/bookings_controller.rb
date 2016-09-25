class BookingsController < ApplicationController

  def new
  end

  def fetchrooms

  end

  def showrooms
    date = Date.new params[:fetch]["start(1i)"].to_i, params[:fetch]["start(2i)"].to_i, params[:fetch]["start(3i)"].to_i
    @rooms= Room.where(building: params[:fetch][:building],size: params[:fetch][:size])
    @existing=Booking.where(:start => date.beginning_of_day..date.end_of_day)
    @booking=Booking.new

  end

  def create
        @booking = Booking.new(booking_params)
    if @booking.save
      flash[:success] = "Booking done successfully"
      render 'fetchrooms'
    else
      render 'fetchrooms'
    end
  end


def show
  @bookings= Booking.where(email: session[:email])
  #@bookings= Booking.all params[:SessionsController ][:session][:email].downcase
end

  def destroy
    @booking=Booking.find(params[:id])
    @booking.destroy
    respond_to do |format|
      format.html { redirect_to getHistory_url, notice: 'Booking was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
  # Use callbacks to share common setup or constraints between actions.
  def set_booking
    @booking = Booking.find(params[:id])
  end

  # Never trust parameters from the scary internet, only allow the white list through.
  def booking_params
    params.require(:booking).permit(:email, :start, :end, :room_id, :team)
  end

end