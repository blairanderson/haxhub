require 'spec_helper'

describe GitActionsController do
  before :each do
    create_repo
    controller.stub(load_repo: Repo.first)
  end

  describe "GET index" do
    context "there are no new git actions" do
      it "returns an empty array" do
        create_project(repo: Repo.first)
        project_id = Project.first.id 
        # get :index, project_id: project_id, before: Time.now
        # expect(response).to eq []
      end
    end
  end
end