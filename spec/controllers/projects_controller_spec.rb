require 'spec_helper'

describe ProjectsController do
  describe "POST create" do
    it "creates new project and repo" do
      create_user; user = User.last
      controller.stub(current_user: user)
      repo_name_owner = "blairand/alpha-feed-engine"
      expect {
        post :create, repo_name_owner: repo_name_owner
      }.to change(user.projects, :count).by(1)
    end

    it "finds duplicate project/repo pair, rejects" do
      create_user; user = User.last
      controller.stub(current_user: user)
      repo_name_owner = "blairand/alpha-feed-engine"
      post :create, repo_name_owner: repo_name_owner
      expect {
        post :create, repo_name_owner: repo_name_owner
      }.to change(user.projects, :count).by(0)
    end

    xit "shows validation error for bad url" do
      # Validations need to be worked on
    end
  end
end

