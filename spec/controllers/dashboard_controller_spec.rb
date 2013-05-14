require 'spec_helper'

describe DashboardController do
  describe "GET #show" do
    
    it "displays the dashboard for current_user" do
      controller.stub(current_user: new_user)
      get :show
      response.should render_template(:show)
    end
  end
end
