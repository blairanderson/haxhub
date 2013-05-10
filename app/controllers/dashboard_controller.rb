class DashboardController < ApplicationController

  def show
    if logged_in?
      @first_repo = current_githuber.repos.all.first
      @first_commits = current_githuber.repos.commits.all @first_repo.owner.login, @first_repo.name
    else
      # redirect_to home_path
    end
  end

end
