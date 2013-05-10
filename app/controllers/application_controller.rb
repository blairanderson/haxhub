class ApplicationController < ActionController::Base
  protect_from_forgery

  helper_method :current_user, :logged_in?, :current_githuber

  def current_user
    @current_user ||= User.find_by_login(session[:login])
  end

  def logged_in?
    true if current_user
  end

  def current_githuber 
    @current_githuber ||= Github.new(
        oauth_token: current_user.token,
        ssl: {:verify => false})
  end
end
