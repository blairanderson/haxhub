require 'spec_helper'

describe PivotalStory do
  before do
    PivotalTrackerService.prepare
  end

  it "fetches all stories for a given Pivotal Tracker project" do
    VCR.use_cassette('fetch_all_stories') do
      stories = PivotalStory.fetch_all_stories('820647')
      result = stories.first
      expect(stories).to_not be nil
      expect(result.project).to eq "SOFTLINE"
      expect(result.requester).to eq "Blair Anderson"
      expect(result.message).to eq "User visits Home Page\n\nAfter clicking the \"Start Here\" Button, they are sent to auth with github. \n\nAfter auth, their account is created and they're redirected to the root_path"
    end
  end

  it "fetches a Pivotal Tracker project" do
    VCR.use_cassette('fetch_all_stories') do
      project = PivotalStory.fetch_project('820647')
      result  = project.name
      expect(result).to eq "SOFTLINE"
    end
  end

  it "fetches all stories related to a project" do
    VCR.use_cassette('fetch_all_stories') do
      project = PivotalStory.fetch_project('820647')
      result  = project.stories.all.count
      expect(result).to eq 22
    end
  end

  it "buils a story from a project" do
    VCR.use_cassette('fetch_all_stories') do
      project = PivotalStory.fetch_project('820647')
      story   = project.stories.all.first
      result  = PivotalStory.build_story(project, story)
      expect(result.class).to eq PivotalStory
    end
  end
end