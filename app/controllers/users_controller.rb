class UsersController < ApplicationController
  before_action :require_login
  skip_before_action :require_login, only: [:new, :create]
  include ApplicationHelper

  def new
    #redirect_to "show" if logged_in
    @user = User.new
  end

  def create
    @user = User.new(user_params)
    if @user.save
      session[:user_id] = @user.id
      redirect_to user_path(@user)
    else
      redirect_to "/"
    end
  end

  def show
    if !logged_in 
      redirect_to "/"
    elsif current_user.id != params[:id].to_i
      redirect_to user_path(current_user), alert: "Access Denied"
    end
    
    @user = current_user
    
    @message = session[:message]
  end

  private

  def user_params
    params.require(:user).permit(:name, :nausea, :happiness, :tickets, :height, :password, :admin)
  end

  def require_login
    #return head(:forbidden) unless session.include? :user_id
    redirect_to "/" unless session.include? :user_id
  end
end
