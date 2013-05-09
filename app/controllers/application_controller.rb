class ApplicationController < ActionController::Base
  protect_from_forgery

  # def current_user
  #   unless session[:username]
      
  #   end
  #   session[:username] = github.users.find(self)

  #   github = Github.new(
  #       oauth_token: session[:github_token],
  #       ssl: {:verify => false}
  #       )
  #     @current_user = github.users.find(self)

  # end
end
