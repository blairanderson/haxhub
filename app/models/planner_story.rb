class PlannerStory < ActiveRecord::Base
  attr_accessible :project,
                  :requester,
                  :message,
                  :planner

  belongs_to :planner

  def self.fetch_all_stories(planner)
    prepare_service
    stories = planner.stories.all
    build_stories(planner, stories)
  end

private

  def self.prepare_service
    PivotalTrackerService.prepare
  end

  def self.build_stories(planner, stories)
    stories.collect { |story| build_story(planner, story) }
  end

  def self.build_story(planner, story)
    pivotal_story = PlannerStory.new
    pivotal_story.project   = planner.name
    pivotal_story.requester = story.requested_by
    pivotal_story.message   = story.description
    pivotal_story.save
    pivotal_story
  end
end