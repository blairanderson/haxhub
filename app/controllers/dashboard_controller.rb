class DashboardController < ApplicationController
  def show
    if logged_in?
      @projects = current_user.projects
    else
      redirect_to root_path, notice: "Get the F outta hurrr"
    end
  end

end