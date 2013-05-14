require 'spec_helper'
require 'ostruct'

describe User do
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
      user = User.find_or_create(github, "token")
      expect(user.login).to eq user.login
    end
  end
end
