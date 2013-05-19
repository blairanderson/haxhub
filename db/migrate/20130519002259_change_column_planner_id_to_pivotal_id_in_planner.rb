class ChangeColumnPlannerIdToPivotalIdInPlanner < ActiveRecord::Migration
  def change
    rename_column :planners, :planner_id, :pivotal_id 
  end
end
