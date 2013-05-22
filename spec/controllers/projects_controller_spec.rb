require 'spec_helper'

describe ProjectsController do

  let(:user) do 
    create_user
    User.last
  end

  before(:each) do 
    expect(user).to be_valid
    controller.stub(current_user: user)
  end

  describe '#destroy' do 
    it 'should delete the project and keep the repo' do
      
    end
  end

  describe "POST create" do

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
      repo_name_owner = "this is crap"
      post :create, repo_name_owner: repo_name_owner
      expect(flash.notice).to include("Sorry")
      expect(user.projects.count).to eq 0
      expect(Project.count).to eq 0
      expect(Repo.count).to eq 0
    end
  end

  describe 'POST#toggle_build_status' do 
    it "toggles the status of the ci_source" do
      GitAction.stub(:fetch_all_commits).and_return(true)
      repo_name_owner = "blairand/alpha-feed-engine"
      post :create, repo_name_owner: repo_name_owner

      ci_source = Project.first.ci_source
      expect(ci_source.active).to eq false

      put :toggle_build_status, {checked: "on", project_id: Project.first.id}
    end
  end

  describe 'POST#add_planner' do 
    it 'adds the pivotal tracker to the project' do 
      GitAction.stub(:fetch_all_commits).and_return(true)
      repo_name_owner = "blairtest/testrepo"
      post :create, repo_name_owner: repo_name_owner
      repo = Repo.first
      expect(repo.name).to eq 'testrepo'
      expect(repo.owner).to eq 'blairtest'
      project = Project.first
      expect(project.repo.id).to eq repo.id

      VCR.use_cassette("another_planner_fetch") do 
        post :add_planner, project_id: project.id, planner_id: 820647
      end
      expect(Planner.first.id).to eq 1
    end
  end

  describe 'POST#webhook' do 
    it 'should enqueue a job for the repo' do 
      create_repo
      payload = {
                :commits    => [{
                  :id        => 123,
                  :message   => "a great message",
                  :url       => "http://www.github.com",
                  :committer => {:username  => "blairtest"},
                  :author    => {:username  => "blairtest",:email => "michael@jackson.com"}
                }],
                :repository => {
                  :name        => "testrepo",
                  :url         => "https://www.github.com/blairtest/testrepo",
                  :owner => {:name  => "blairtest",
                            :email => "blair81+test@gmail.com"}
                                }
              }.to_json
      Resque.should_receive(:enqueue)
      post :webhook, payload: payload
    end
  end
end

