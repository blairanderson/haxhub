require 'spec_helper'
require 'ostruct'

describe User do
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
