class RidesController < ApplicationController
  def create
    @user = User.find(params[:user_id])
    @attraction = Attraction.find(params[:attraction_id])
    @ride = Ride.new(user_id: @user.id, attraction_id: @attraction.id)
    session[:message] = @ride.take_ride
    redirect_to user_path(@user)
  end
end
