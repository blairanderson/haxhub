class Story < ActiveRecord::Base
  attr_accessible :requester,
                  :message,
                  :planner,
                  :url,
                  :status,
                  :story_type,
                  :story_id,
                  :points

  belongs_to :planner

  def self.fetch_all_stories(planner)
    prepare_service
    stories = planner.stories.all
    build_stories(stories)
  end

private
  def self.prepare_service
    PivotalTrackerService.prepare
  end

  def self.build_stories(stories)
    stories.collect { |story| build_story(story) }
  end

  def self.build_story(story)
    create( requester:  story.requested_by,
            message:    story.name,
            story_type: story.story_type,
            points:     story.estimate,
            story_id:   story.id,
            status:     story.current_state,
            url:        story.url )
  end
end