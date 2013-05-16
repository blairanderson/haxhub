class PivotalTrackerService
  def self.prepare
    PivotalTracker::Client.token   = 'b529b5ca0e3cacccc56456ba71e5abd1'
    # PivotalTracker::Client.use_ssl = true
  end

  def self.project(project_id)
    PivotalTracker::Project.find(project_id)
  end
end