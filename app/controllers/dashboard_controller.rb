class DashboardController < ApplicationController
  
  def show
    if logged_in?
      @projects = current_user.projects
      @repo_auto_complete = current_user.search
    else
      redirect_to root_path, notice: "Get the F outta hurrr"
    end
  end
end



 
