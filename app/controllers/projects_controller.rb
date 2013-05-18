class ProjectsController < ApplicationController
  before_filter :require_login

  def create
    if Project.create_with_repo(params[:repo_name_owner], current_user)
      notice = "Project Added"
    end
    redirect_to dashboard_path, notice: notice
  end

  def add_planner
    project_id = params[:project_id].to_i
    planner_id = params[:planner_id].to_i
    if Project.add_planner(project_id, planner_id)
      notice = "Planner Added"
    end
    redirect_to dashboard_path, notice: notice
  end
end
