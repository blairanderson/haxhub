class Planner < ActiveRecord::Base
  attr_accessible :name,
                  :pivotal_id

  has_many :projects
  has_many :activities

  def build_planner
    api_planner = fetch_planner(self.pivotal_id)
    self.name   = api_planner.name
    self.save
    Resque.enqueue(FetchActivities, self.id, 0)
  end

  def fetch_activities
    Activity.fetch_all_activities(id, pivotal_id)
  end

private
  def fetch_planner(pivotal_id)
    PivotalTrackerService.planner(pivotal_id)
  end
end
