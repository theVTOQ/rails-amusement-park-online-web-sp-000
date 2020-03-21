class UsersController < ApplicationController
  before_action :require_login
  skip_before_action :require_login, only: [:new, :create]

  def new
    @user = User.new
  end

  def create
    @user = User.new(user_params)
    #binding.pry
    if @user.save
      session[:user_id] = @user.id
      redirect_to user_path(@user)
    else
      binding.pry
      render "new"
    end
  end

  def show
    redirect_to "/" unless logged_in && current_user.id == params[:id].to_i
    @user = User.find(params[:id])
    #@message = params[:message]
  end

  private

  def user_params
    params.require(:user).permit(:name, :nausea, :happiness, :tickets, :height, :password, :admin)
  end

  def require_login
    return head(:forbidden) unless session.include? :user_id
  end
end
