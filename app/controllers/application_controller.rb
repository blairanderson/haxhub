class ApplicationController < ActionController::Base
  protect_from_forgery

  helper_method :current_user, :github_token

  def current_user
    # @current_user ||= User.find_or_create(session[:username]) # To use when user model created
    github_token.users.find(self)
  end

  def github_token
    if session[:github_token]    
      @github_token ||= Github.new(
        oauth_token: session[:github_token],
        ssl: {:verify => false})
    end
  end
end
