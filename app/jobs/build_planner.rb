class BuildPlanner
  @queue = :work

  def self.perform(planner_id, counter)
    begin

      planner = Planner.find(planner_id)
      unless planner.status = "not-found"
        planner.build_planner
      end

    rescue
      if counter.to_i < 4
        Resque.enqueue(BuildPlanner, planner_id, counter.to_i + 1)
      else
        planner = Planner.find(planner_id)
        planner.status = "not-found"
        planner.save
      end
    end
  end
end
