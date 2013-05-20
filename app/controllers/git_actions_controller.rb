class GitActionsController < ApplicationController
  before_filter :load_repo

  def index
    @git_actions = @repo.git_actions.where('event_at > ?', DateTime.parse(params[:before])+(1.seconds))
  end

private
  def load_repo
    @repo = current_user.projects.find(params[:project_id]).repo
  end
end
