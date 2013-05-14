class ProjectsController < ApplicationController
  before_filter :require_login

  def create
    if repo = Repo.create_from_github(params[:repo_name_owner])
      unless current_user.duplicate_projects?(repo)
        project = Project.create(title: repo.name, repo: repo)
        current_user.projects << project
        notice = "Project Added"
      end
    end
    redirect_to dashboard_path, notice: notice
  end
end
