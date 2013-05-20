class Activity < ActiveRecord::Base
  attr_accessible :activity_id,
                  :author,
                  :description,
                  :event_type,
                  :occurred_at

  belongs_to :planner

  def self.fetch_all_activities(planner)
    prepare_service
    activities = planner.activities.all
    build_activities(activities)
  end

  def event_type_is(string)
    event_type == string
  end

private
  def self.prepare_service
    PivotalTrackerService.prepare
  end

  def self.build_activities(activities)
    activities.collect { |activity| build_activity(activity) }
  end

  def self.build_activity(activity)
    create( activity_id: activity.id,
            author:      activity.author,
            description: activity.description,
            event_type:  activity.event_type,
            occurred_at: activity.occurred_at )
  end
end