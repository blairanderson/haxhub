class FetchActivities
  @queue = :work

  def self.perform(planner_id)
    planner = Planner.find(planner_id)
    begin
      planner.fetch_activities
    rescue
      Resque.enqueue(FetchActivities, planner.id)
    end
  end
end