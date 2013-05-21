require 'spec_helper'

describe Activity do
  before do
    PivotalTrackerService.prepare
  end

  describe "#story_type_is" do
    it "returns true if the status matches" do
      activity = create_activity(status: "unstarted")
      expect(activity.status_is("unstarted")).to eq true
    end

    it "returns false otherwise" do
      activity = create_activity(status: "unstarted")
      expect(activity.status_is("finished")).to eq false
    end
  end

  it "fetches all activities for a given Pivotal Tracker project" do
    VCR.use_cassette('build_activities') do
      planner    = Planner.create
      Activity.fetch_all_activities(planner.id, '820647')
      activities = planner.activities.all
      result     = planner.activities.last
      expect(activities).to_not      be nil
      expect(activities.count).to    eq 82
      expect(result.author).to       eq "Blair Anderson"
      expect(result.description).to  eq "Blair Anderson started \"User create a feed that tracks his project information from Github.\""
    end
  end
end
