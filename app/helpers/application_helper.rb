module ApplicationHelper
  def current_user
    User.find_by(id: session[:user_id])
  end

  def current_user_is_admin
    return false if current_user.nil?
    current_user.admin
  end

  def logged_in
    !session[:user_id].nil?
  end
end
