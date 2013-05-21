require 'spec_helper'


describe FetchGitActions do 
  let(:repo) do 
    create_repo
  end

  let(:user) do 
    create_user
  end

  describe '.perform' do
    it 'should fetch_all_git_actions' do
      VCR.use_cassette("fetch_git_actions_job") do 
        FetchGitActions.perform(user.id, repo.id)
      end
      expect(repo.git_actions.count).to be > 0
    end
  end

end
