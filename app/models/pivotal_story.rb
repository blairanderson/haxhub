class PivotalStory < ActiveRecord::Base
  attr_accessible :project,
                  :requester,
                  :message

  def self.fetch_all_stories(project)
    PivotalTrackerService.prepare
    project = fetch_project(project)
    stories = project.stories.all
    build_stories(project, stories)
  end

  def self.build_stories(project, stories)
    stories.collect { |story| build_story(project, story) }
  end

  def self.build_story(project, story)
    pivotal_story = PivotalStory.new
    pivotal_story.project   = project.name
    pivotal_story.requester = story.requested_by
    pivotal_story.message   = story.description
    pivotal_story.save
  end

  def self.fetch_project(project)
    PivotalTracker::Project.find(project)
  end
end