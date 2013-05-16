class PivotalStory < ActiveRecord::Base
  attr_accessible :project,
                  :requester,
                  :message

  def self.fetch_all_stories(project_id)
    PivotalTrackerService.prepare
    project = fetch_project(project_id)
    stories = project.stories.all
    build_stories(project, stories)
  end

private

  def self.fetch_project(project_id)
    PivotalTrackerService.project(project_id)
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
    pivotal_story
  end
end