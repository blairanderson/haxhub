require 'spec_helper'

describe Planner do
  it "builds a planner" do
    VCR.use_cassette('build_planner') do
      planner = Planner.create(pivotal_id: 820647)
      planner.build_planner

      expect(planner.class).to eq Planner
      expect(planner.name).to eq "SOFTLINE"
    end
  end

  it "attaches the activities to the planner" do
    VCR.use_cassette('fetch_build_planner') do
      planner = Planner.create(pivotal_id: 820647)
      planner.build_planner
      expect(planner.name).to eq "SOFTLINE"
      
      planner.fetch_activities
      expect(planner.activities.count).to be > 10
    end
  end
end
