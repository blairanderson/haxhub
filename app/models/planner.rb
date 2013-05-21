class Planner < ActiveRecord::Base
  attr_accessible :name,
                  :pivotal_id

  has_many :projects
  has_many :activities

  def self.build_planner(pivotal_id)
    planner     = fetch_planner(pivotal_id)
    name        = planner.name
    new_planner = Planner.where(name: name, pivotal_id: pivotal_id).first_or_create
    Resque.enqueue(FetchActivities, new_planner.id)
    new_planner
  end

  def fetch_activities
    Activity.fetch_all_activities(id, pivotal_id)
  end

private
  def self.fetch_planner(pivotal_id)
    PivotalTrackerService.planner(pivotal_id)
  end
end
