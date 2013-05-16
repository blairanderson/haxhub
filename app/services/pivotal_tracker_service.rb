class PivotalTrackerService
  def self.prepare
    PivotalTracker::Client.token   = 'b529b5ca0e3cacccc56456ba71e5abd1'
    PivotalTracker::Client.use_ssl = true
  end
end