class RidesController < ApplicationController
  def create
    @user = current_user
    @attraction = Attraction.find(params[:attraction_id])
    @ride = Ride.new(user_id: current_user.id, attraction_id: @attraction.id)
    params[:message] = @ride.save
    redirect_to user_path(@user)
  end
end
