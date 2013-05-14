class ProjectsController < ApplicationController
  before_filter :require_login

  def create
    repo = Repo.create_from_github(params[:repo_name_owner])

    if current_user.duplicate_projects?(repo)
      notice =  "Already Own this Repo"
    else
      project = Project.create(title: repo.name, repo: repo)
      current_user.projects << project
      notice = "Project Added"
    end
    
    redirect_to dashboard_path, notice: notice
  end
end
