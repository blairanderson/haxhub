class Planner < ActiveRecord::Base
  attr_accessible :name,
                  :pivotal_id

  has_many :projects
  has_many :activities

  def self.build_planner(pivotal_id)
    prepare_service
    planner     = fetch_planner(pivotal_id)
    name        = planner.name
    new_planner = Planner.where(name: name, pivotal_id: pivotal_id).first_or_create
    new_planner.activities = fetch_all_activities(planner)
    new_planner
  end

private
  def self.prepare_service
    PivotalTrackerService.prepare
  end

  def self.fetch_planner(pivotal_id)
    PivotalTrackerService.planner(pivotal_id)
  end

  def self.fetch_all_activities(planner)
    Activity.fetch_all_activities(planner)
  end
end