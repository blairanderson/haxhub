class ProjectsController < ApplicationController
  before_filter :require_login

  def create
    if Project.create_with_repo(params[:repo_name_owner], current_user)
      notice = "Project added"
    else
      notice = "Sorry, that didn't work."
    end
    redirect_to dashboard_path, notice: notice
  end

  def add_planner
    project_id = params[:project_id].to_i
    project    = Project.find(project_id)

    planner_id = params[:planner_id].to_i
    if project.add_planner(planner_id)
      notice = "Planner added"
    end
    redirect_to dashboard_path, notice: notice
  end

  def webhook
    push = JSON.parse(params[:payload])
    puts "I got some JSON: #{push.inspect}"
    render :nothing => true
  end
end
