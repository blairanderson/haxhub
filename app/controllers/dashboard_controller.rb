class DashboardController < ApplicationController

  def show
    if github_token
      @first_repo = github_token.repos.all.first
      @first_commits = github_token.repos.commits.all @first_repo.owner.login, @first_repo.name
    end
  end

end
