require 'spec_helper'

describe Repo do
  describe ".translate_to_ruby" do
    context "current_user exists and has github token" do
      it "translates github gem to repo object" do
        user = FactoryGirl.create(:user)
        repo = Repo.translate_to_ruby(user)
        expect(repo.class).to be Repo
      end

      it "repo object must contain valid project" do
        user = FactoryGirl.create(:user)
        repo = Repo.translate_to_ruby(user)
        expect(repo.project).to_not be nil
      end
    end
  end
end