class DashboardController < ApplicationController
  
  def show
    if logged_in?
      @projects = current_user.projects
      load_search
    else
      redirect_to root_path, notice: "Get the F outta hurrr"
    end
  end

  def load_search
    @repo_auto_complete ||= current_user.repos
  end
end



 
