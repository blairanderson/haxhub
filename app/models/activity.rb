class Activity < ActiveRecord::Base
  attr_accessible :activity_id,
                  :author,
                  :description,
                  :event_type,
                  :occurred_at,
                  :requester,
                  :message,
                  :story_type,
                  :points,
                  :story_id,
                  :status,
                  :url

  belongs_to :planner

  default_scope order('occurred_at DESC')

  def self.fetch_all_activities(planner_id, pivotal_id, limit = 100)
    planner        = PivotalTrackerService.planner(pivotal_id)
    api_activities = planner.activities.all(:limit => limit)
    api_stories    = planner.stories.all
    build_activities(api_stories, api_activities, planner_id)
  end

  def feature?
    story_type == "feature"
  end

  def status_is(string)
    status == string
  end

private

  def self.build_activities(api_stories, api_activities, planner_id)
    api_activities.collect do |api_activity|
      build_activity(api_stories, api_activity, planner_id)
    end
  end

  def self.get_story_ids(api_activity)
    api_activity.stories.collect{ |story| story.id }
  end

  def self.api_story_from_story_ids(story_ids, api_stories)
    api_stories.select do |api_story|
      story_ids.include?(api_story.id)
    end.first
  end

  def self.build_activity(api_stories, api_activity, planner_id)
    begin
    new_activity = where(planner_id:  planner_id,
                         activity_id: api_activity.id).first_or_create

    story_ids    = get_story_ids(api_activity)
    api_story    = api_story_from_story_ids(story_ids, api_stories)

    new_activity.attributes = {
      author:      api_activity.author,
      description: api_activity.description,
      event_type:  api_activity.event_type,
      occurred_at: api_activity.occurred_at,
      requester:   api_story.requested_by,
      message:     api_story.name,
      story_type:  api_story.story_type,
      points:      api_story.estimate,
      story_id:    api_story.id,
      status:      api_activity.description.match(/finished|delivered|started|accepted|edited|added|estimated/)[0],
      url:         api_story.url }

    new_activity.save

    rescue
      new_activity.destroy
    end

    return new_activity if new_activity
  end
end
