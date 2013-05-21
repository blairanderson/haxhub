class PivotalTrackerService
  def self.planner(pivotal_id)
    PivotalTracker::Client.token   = ENV['PIVOTAL_TOKEN']
    PivotalTracker::Client.use_ssl = true
    PivotalTracker::Project.find(pivotal_id)
  end
end
