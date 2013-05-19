class Story < ActiveRecord::Base
  attr_accessible :requester,
                  :message,
                  :planner,
                  :url,
                  :status,
                  :type,
                  :story_id,
                  :points

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
    pivotal_story = new
    pivotal_story.requester = story.requested_by
    pivotal_story.message   = story.name
    pivotal_story.save
    pivotal_story
  end
end