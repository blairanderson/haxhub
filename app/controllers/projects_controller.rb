class ProjectsController < ApplicationController
  before_filter :require_login

  def create
    if Project.create_with_repo(params[:repo_name_owner], current_user)
      notice = "Project Added"
    else
      notice = "Sorry, That didn't Work."
    end
    redirect_to dashboard_path, notice: notice
  end
end
