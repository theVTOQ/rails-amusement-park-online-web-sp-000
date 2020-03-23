class AttractionsController < ApplicationController
  before_action :find_attraction
  skip_before_action :find_attraction, only: [:new, :create, :index]
  include ApplicationHelper

  def new
    @attraction = Attraction.new
  end

  def edit
  end

  def create
    @attraction = Attraction.new(attractions_params)
    redirect_to "/new" unless @attraction.save
    redirect_to attraction_path(@attraction)
  end

  def update
    redirect_to "/edit" unless @attraction.update(attractions_params)
    redirect_to attraction_path(@attraction)
  end

  def index
    @attractions = Attraction.all
  end

  def show
    @user = current_user
    #params[:attraction_id] = params[:id]
    #@ride = Ride.new(user_id: @user.id, attraction_id: @attraction.id)
  end

  private

  def attractions_params
    params.require(:attraction).permit(:name, :min_height, :happiness_rating, :nausea_rating, :tickets)
  end

  def find_attraction
    @attraction = Attraction.find_by(id: params[:id])
  end
end
