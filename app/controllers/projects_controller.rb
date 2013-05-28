class ProjectsController < ApplicationController
  before_filter :require_login, except: [:webhook]

  def create
    if Project.create_with_repo(params, current_user)
      notice = "Project added"
    else
      notice = "Sorry, that didn't work."
    end
    redirect_to dashboard_path, notice: notice
  end

  def destroy
    project = Project.find(params[:project_id])
    project.destroy
    redirect_to dashboard_path, notice: "It's gone!"
  end

  def toggle_build_status
    ci_source = current_user.projects.find(params[:project_id]).ci_source
    params[:checked] ? value = :on : value = :off
    
    ci_source.build_status(value) ? notice = "Travis #{ci_source.status_to_s}!" : notice = "Something went horribly wrong!"

    redirect_to dashboard_path, notice: notice
  end

  def add_planner
    if Project.find(params[:project_id]).add_planner(params[:planner_id])
      redirect_to dashboard_path, notice: "Processing Your Request"
    else
      redirect_to dashboard_path, notice: "Sorry, there was an error with your Request"
    end
  end

  def webhook
    Github::Fetcher.fetch JSON.parse(params[:payload])

    render :nothing => true
  end
end
