require 'spec_helper'

describe Activity do
  before do
    PivotalTrackerService.prepare
  end

  describe "#event_type_is" do
    it "returns true if the status matches" do
      activity = create_activity(event_type: "unstarted")
      expect(activity.event_type_is("unstarted")).to eq true
    end

    it "returns false otherwise" do
      activity = create_activity(event_type: "unstarted")
      expect(activity.event_type_is("finished")).to eq false
    end
  end

  it "fetches all activities for a given Pivotal Tracker project" do
    VCR.use_cassette('build_activities') do
      planner    = Planner.fetch_planner('820647')
      activities = Activity.fetch_all_activities(planner)
      result     = activities.first
      expect(activities).to_not      be nil
      expect(activities.count).to    eq 8
      expect(result.author[0..4]).to eq "Blair"
      expect(result.description).to  eq "Blair Anderson added comment: \"Please help list all the use-cases that require saving:\""
    end
  end

  it "fetches all activities related to a project" do
    VCR.use_cassette('build_planner_activities') do
      planner = Planner.fetch_planner('820647')

      expect( planner.activities.all.count ).to eq 8
    end
  end

  it "buils a activity from a project" do
    VCR.use_cassette('build_planner_activities') do
      planner  = Planner.fetch_planner('820647')
      activity = planner.activities.all.first
      result   = Activity.build_activity(activity)
      expect(result.class).to eq Activity
    end
  end
end
