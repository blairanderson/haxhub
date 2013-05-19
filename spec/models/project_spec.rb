require 'spec_helper'

describe Project do
  let(:user) do
    create_user
  end

  let(:project) do
    create_project
  end

  it "creates a project with a repo" do
    VCR.use_cassette('project') do
      url = "https://github.com/novohispano/arepa"
      Project.create_with_repo(url, user)
      result = Project.all.last
      expect(result.title).to eq "arepa"
      expect(result.repo_id).to eq 1
    end
  end

  it "adds a planner to a project" do
    VCR.use_cassette('project') do
      pivotal_id = 820647
      project.add_planner(pivotal_id)
      planner = project.planner
      expect(planner).not_to eq nil
      expect(planner.pivotal_id).to eq 820647
    end
  end
end