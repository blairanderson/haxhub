require 'spec_helper'

describe Repo do 
  context 'validations' do 
    let(:repo) do
      new_repo
    end

    before do
      expect(repo).to be_valid
    end

    it 'should have a valid owner' do 
      repo.owner = nil
      expect( repo ).to be_invalid
    end

    it 'should have a valid name'  do
      repo.name = nil
      expect( repo ).to be_invalid
    end

    describe '#user_and_repo_from_string' do
      it 'should work correctly' do

      end
    end

    describe '.create_from_github' do
      it 'should find a repo that alread exists' do
        repo.save
        url = "https://github.com/blairand/alpha-feed-engine"
        new_repo = Repo.create_from_github(url)
        expect(repo.id).to eq new_repo.id
      end

      it 'should create repo from git_repo HTTP' do 
        url = "https://github.com/blairand/alpha-feed-engine"
        repo = Repo.create_from_github(url)
        expect(repo.owner).to eq "blairand"
        expect(repo.name).to eq "alpha-feed-engine"
      end

      it 'should create repo from git_repo SSH' do 
        url = "git@github.com:blairand/alpha-feed-engine.git"
        repo = Repo.create_from_github(url)
        expect(repo.owner).to eq "blairand"
        expect(repo.name).to eq "alpha-feed-engine"
      end

      it 'should create repo from git_repo Read-Only' do 
        url = "git://github.com/blairand/alpha-feed-engine.git"
        repo = Repo.create_from_github(url)
        expect(repo.owner).to eq "blairand"
        expect(repo.name).to eq "alpha-feed-engine"
      end

      it 'should create repo from owner/name' do 
        string = "blairand/alpha-feed-engine"
        repo = Repo.create_from_github(string)
        expect(repo.owner).to eq "blairand"
        expect(repo.name).to eq "alpha-feed-engine"
      end

      it 'should not work with just a username' do 
        string = "blairand"
        repo = Repo.create_from_github(string)
        expect(repo).to_not be
      end

    end
  end
end
