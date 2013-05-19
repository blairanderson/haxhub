class AddColumnPlannerIdToPlanners < ActiveRecord::Migration
  def change
    add_column :planners, :planner_id, :integer
  end
end
