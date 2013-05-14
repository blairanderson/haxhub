class ApplicationController < ActionController::Base
  protect_from_forgery

  helper_method :current_user, :logged_in?

  def current_user
    @current_user ||= User.find_by_login(session[:login])
  end

  def logged_in?
    current_user ? true : false
  end

  def require_login
    unless logged_in?
      redirect_to root_path, notice: "Please log in."
    end
  end
end