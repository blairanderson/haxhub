require 'spec_helper'

describe Repo do
  describe ".translate_all_to_ruby" do
    context "current_user exists and has github token" do
      it "translates github gem repos to repo objects" do
        # user = FactoryGirl.create(:user)
        # repo = Repo.translate_to_ruby(user)
        # expect(repo.class).to be Repo
        # Requires VCR
      end
    end
  end

  describe ".translate_to_ruby" do
    context "current_user exists and has github token" do
      it "creates single repo object from repo mashie hash" do
        # user = FactoryGirl.create(:user)
        # repo = Repo.translate_to_ruby(user)
        # expect(repo.class).to be Repo
        # Requires VCR
      end
    end
  end

  describe "#add_to_project" do
    before :each do
      @project = FactoryGirl.create(:project)
      @repo = FactoryGirl.create(:repo)
    end

    it "adds / overwrites project_id to repo" do
      @repo.add_to_project(@project)
      expect(@repo.project).to eq @project
    end

    it "adds / overwrites repo_id to project" do
      @repo.add_to_project(@project)
      expect(@project.repo).to eq @repo
    end
  end
end