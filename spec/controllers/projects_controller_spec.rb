require 'spec_helper'

describe ProjectsController do
  describe "POST create" do
    let(:user) do 
      create_user
      User.last
    end

    before(:each) do 
      expect(user).to be_valid
      controller.stub(current_user: user)
    end

    it "creates new project and repo" do
      GitAction.stub(:fetch_all_commits).and_return(true)
      repo_name_owner = "blairand/alpha-feed-engine"
      expect {
        post :create, repo_name_owner: repo_name_owner
      }.to change(user.projects, :count).by(1)
    end

    it "finds duplicate project/repo pair, rejects" do
      GitAction.stub(:fetch_all_commits).and_return(true)
      repo_name_owner = "blairand/alpha-feed-engine"
      post :create, repo_name_owner: repo_name_owner
      expect {
        post :create, repo_name_owner: repo_name_owner
      }.to change(user.projects, :count).by(0)
    end

    it "shows error for submitting string with spaces" do
      GitAction.stub(:fetch_all_commits).and_return(true)
      repo_name_owner = "invalid repo name"
      post :create, repo_name_owner: repo_name_owner
      expect(flash.notice).to include("Sorry")
      expect(user.projects.count).to eq 0
      expect(Project.count).to eq 0
      expect(Repo.count).to eq 0
    end

    it "shows error for submitting invalid " do
      GitAction.stub(:fetch_all_commits).and_return(true)
      repo_name_owner = "invalid repo name"
      post :create, repo_name_owner: repo_name_owner
      expect(flash.notice).to include("Sorry")
      expect(user.projects.count).to eq 0
      expect(Project.count).to eq 0
      expect(Repo.count).to eq 0
    end

    

  end
end

