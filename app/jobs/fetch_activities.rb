class FetchActivities
  @queue = :work

  def self.perform(planner_id, counter)
    planner = Planner.find(planner_id)
    begin
      if counter.to_i < 4
        planner.fetch_activities
      else
        planner.update_attribute(:status, "not-found")
      end
    rescue Exception
      # Resque.enqueue(FetchActivities, planner.id, counter.to_i+1)
    end
  end
end
