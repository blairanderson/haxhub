class DashboardController < ApplicationController
  
  def show  
    if logged_in?
      @projects = current_user.projects
      # J3 said he wanted autocomplete. It is here. I would like for this to be in a background job. 
      if session[:repos]
        @repo_auto_complete = session[:repos]
      else
        @repo_auto_complete ||= current_user.repos
        session[:repos] = @repo_auto_complete
      end
    else
      redirect_to root_path, notice: "Get the F outta hurrr"
    end
  end

end



 
