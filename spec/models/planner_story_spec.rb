require 'spec_helper'

describe PlannerStory do
  before do
    PivotalTrackerService.prepare
  end

  it "fetches all stories for a given Pivotal Tracker project" do
    VCR.use_cassette('build_planner_stories') do
      planner = Planner.fetch_project('820647')
      stories = PlannerStory.fetch_all_stories(planner)
      result  = stories.first
      expect(stories).to_not be nil
      expect(stories.count).to be > 10
      expect(result.project).to eq "SOFTLINE"
      expect(result.requester[0..4]).to eq "Jorge"
      expect(result.message).to eq "Connect to the API.\nConvert the stories into Ruby objects."
    end
  end

  it "fetches all stories related to a project" do
    VCR.use_cassette('build_planner_stories') do
      planner = Planner.fetch_project('820647')
      
      expect( planner.stories.all.count ).to be > 10
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
