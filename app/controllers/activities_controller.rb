class ActivitiesController < ApplicationController
  before_filter :load_planner

  def index
    if @planner
      @activities = @planner.activities.where('occurred_at > ?', DateTime.parse(params[:before])+(1.seconds)).order("created_at DESC")
    else
      @activities = []
    end
  end

private
  def load_planner
    @planner = current_user.projects.find(params[:project_id]).planner
  end
end
