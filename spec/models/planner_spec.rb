require 'spec_helper'

describe Planner do
  it "builds a planner" do
    VCR.use_cassette('build_planner') do
      planner = Planner.build_planner('820647')
      expect(planner.class).to eq Planner
      expect(planner.name).to eq "SOFTLINE"
    end
  end

  it "attaches the stories to the planner" do
    VCR.use_cassette('build_planner') do
      planner = Planner.build_planner('820647')
      expect(planner.stories.count).to be > 10
    end
  end
end
