class DashboardController < ApplicationController

  def show
    if session[:github_token]    
      github = Github.new(
        oauth_token: session[:github_token],
        ssl: {:verify => false}
        )
      @repos = github.repos.all
      @users = github.users.all
      @current_user = github.users.find(self)
    else
      @repos = []
    end
  end

end
