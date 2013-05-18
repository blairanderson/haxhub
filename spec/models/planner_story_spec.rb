require 'spec_helper'

describe PlannerStory do
  before do
    PivotalTrackerService.prepare
  end

  it "fetches all stories for a given Pivotal Tracker project" do
    VCR.use_cassette('build_planner_stories') do
      planner = Planner.fetch_project('820647')
      stories = PlannerStory.fetch_all_stories(planner)
      result  = stories.last
      expect(stories).to_not be nil
      expect(stories.count).to eq 23
      expect(result.project).to eq "SOFTLINE"
      expect(result.requester).to eq "Blair Anderson"
      expect(result.message).to eq "Majority of API access should be done in the background processes. \n\nThey should check for new data and create it when necessary"
    end
  end

  it "fetches all stories related to a project" do
    VCR.use_cassette('build_planner_stories') do
      planner = Planner.fetch_project('820647')
      result  = planner.stories.all.count
      expect(result).to eq 23
    end
  end

  it "buils a story from a project" do
    VCR.use_cassette('build_planner_stories') do
      planner = Planner.fetch_project('820647')
      story   = planner.stories.all.first
      result  = PlannerStory.build_story(planner, story)
      expect(result.class).to eq PlannerStory
    end
  end
end