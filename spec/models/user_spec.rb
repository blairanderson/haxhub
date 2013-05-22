require 'spec_helper'
require 'ostruct'

describe User do
  describe '#repos' do 
    it 'should fill search attribute with repos' do 
      VCR.use_cassette("user_repos") do 
        user = create_user

        user.repos

        expect(user.search).to eq "[\"https://github.com/blairtest/test-repo\",\"https://github.com/blairtest/testrepo\"]"
      end
    end
  end

  describe "#duplicate_projects?" do
    it "returns true if user already has project with repo" do
      user = new_user; repo = new_repo; project = new_project(repo: repo)
      user.projects << project
      expect(user.duplicate_projects?(repo)).to be true
    end

    it "returns false if repo does not exist" do
      expect(new_user.duplicate_projects?(new_repo)).to be false
    end
  end

  describe ".find_or_create" do
    it "creates and returns user if user login does not exist" do
      github = OpenStruct.new(login: "non-existant")
      user = User.find_or_create(github, "token")
      expect(user.login).to eq 'non-existant'
      # expect(user).to change { User.count }.by 1
    end

    it "finds and returns user if user exists" do
      user = FactoryGirl.create(:user)
      github = OpenStruct.new(login: user.login)
      VCR.use_cassette("this_should_not_work") do 
        user = User.find_or_create(github, "token")
        expect(user.login).to eq user.login
      end
    end
  end
end
