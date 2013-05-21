class PivotalTrackerService
  def self.prepare
    PivotalTracker::Client.token   = ENV['PIVOTAL_TOKEN']
    PivotalTracker::Client.use_ssl = true
  end

  def self.planner(pivotal_id)
    PivotalTracker::Project.find(pivotal_id)
  end
end
