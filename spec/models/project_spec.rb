require 'spec_helper'

describe Project do
  let(:user) do
    user = new_user
    user.save
    user
  end

  let(:project) do
    project = new_project
    project.save
    project
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
      project_id = project.id
      planner_id = 820647
      Project.add_planner(project_id, planner_id)
      result = project.planner
      expect(result).not_to eq nil
      expect(result.name).to eq 'SOFTLINE'
    end
  end
end