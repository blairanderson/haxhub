require 'spec_helper'

describe Planner do
  it "builds a planner" do
    VCR.use_cassette('build_planner') do
      planner = Planner.build_planner('820647')
      expect(planner.class).to eq Planner
      expect(planner.name).to eq "SOFTLINE"
    end
  end

  it "attaches the activities to the planner" do
    VCR.use_cassette('build_planner') do
      planner = Planner.build_planner('820647')
      expect(planner.activities.count).to eq 8
    end
  end
end
