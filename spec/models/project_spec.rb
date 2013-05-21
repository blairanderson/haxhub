require 'spec_helper'

describe Project do
  let(:user) do
    create_user
  end

  let(:project) do
    create_project
  end

  let(:repo) do 
    create_repo
  end

  it "creates a project with a repo" do
    VCR.use_cassette('project') do
      params = {repo_name_owner: "https://github.com/novohispano/arepa"}
      Project.create_with_repo(params, user)
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
  describe '#add_ci_source' do 
    
    it 'adds a ci_source' do 
      project.repo = repo
      
      expect(project).to be_valid
      expect(repo).to be_valid

      project.add_ci_source

      expect(CiSource.count).to           eq 1
      expect(project.ci_source).not_to    eq nil
      target_source = CiSource.first
      expect(project.ci_source.id).to     eq target_source.id

      expect(project.ci_source.name).to   eq project.repo.name
      expect(project.ci_source.owner).to  eq project.repo.owner
    end

    it 'does not add duplicate ci_sources' do 
      project.repo = repo
      expect(project).to be_valid
      expect(repo).to be_valid

      project.add_ci_source
      expect(CiSource.count).to eq 1

      project.add_ci_source
      expect(CiSource.count).to eq 1

      target_source = CiSource.last
      expect(project.ci_source_id).to eq target_source.id
    end

  end
end
