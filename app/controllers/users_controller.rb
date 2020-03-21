class UsersController < ApplicationController
  before_action :require_login
  skip_before_action :new, :create

  def new
    @user = User.new
  end

  def create
    @user = User.new(user_params)
    redirect_to "new" unless @user.save
    redirect_to user_path(@user)
  end

  def show
    @user = User.find(params[:id])
  end

  private

  def users_params
    params.require(:user).permit(:name, :nausea, :happiness, :tickets, :height, :password_digest)
  end

  def require_login
    return head(:forbidden) unless session.include? :user_id
  end
end
