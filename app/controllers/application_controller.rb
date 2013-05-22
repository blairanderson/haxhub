class ApplicationController < ActionController::Base
  protect_from_forgery

  helper_method :current_user, :logged_in?, :first_li_event_at, :last_li_event_at

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

  def first_li_event_at
    'Sat, 01 Jan 1994 00:00:00 +0000'
  end

  def last_li_event_at
    '01 Jan 2100 00:00:00 +0000'
  end
end