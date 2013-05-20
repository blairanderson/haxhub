require 'spec_helper'


describe UpdateRepo do 
  let(:repo) do 
    create_repo
  end
  describe '.perform' do
    it 'should find the repo' do
      VCR.use_cassette("update_repo_job") do 
        UpdateRepo.perform(repo.id)
      end
      expect(repo.git_actions.count).to be > 0
    end
  end

end
