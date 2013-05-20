require 'spec_helper'

describe CiSource do

  let(:project) do 
    create_project
  end

  let(:ci_source) do 
    create_ci_source
  end

  before(:each) do
    expect(project).to be_valid
    expect(ci_source).to be_valid
  end

  describe '#active?' do 
    it 'returns true if active' do 
      expect(ci_source.active?).to eq false

      VCR.use_cassette('ci_source_activate') do 
        ci_source.activate
      end

      expect(ci_source.active?).to eq true
    end
  end

  describe ".activate_ci_source" do 
    it 'should activate an inactive ci_source' do 
      expect(ci_source.active).to eq false
      
      VCR.use_cassette('ci_source_activate') do 
        ci_source.activate
      end

      expect(ci_source.active).to eq true
    end
  end

  describe '#fetch_all_test_builds' do 
    it 'should fetch and create all test builds' do
      expect(ci_source.test_builds).to eq []

      VCR.use_cassette('ci_source') do 
        ci_source.fetch_all_test_builds
      end

      test_builds = ci_source.test_builds.all

      expect(test_builds.count).to be > 0
      expect(test_builds.first.ci_source_id).to eq ci_source.id 
    end
  end
end
