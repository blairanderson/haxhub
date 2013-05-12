class ApplicationController < ActionController::Base
  protect_from_forgery

  helper_method :current_user, :logged_in?

  def current_user
    @current_user ||= User.find_by_login(session[:login])
  end

  def logged_in?
    true if current_user
  end

  def current_github(user = current_user)
    @current_github ||= Github.new(
      oauth_token: user.token,
      ssl: {:verify => false})
  end
end