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
      @first_repo = @repos.first
      @first_commits = github.repos.commits.all @first_repo.owner.login, @first_repo.name

    else
      @repos = []
    end
  end

end
