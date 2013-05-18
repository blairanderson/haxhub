class AddPlannerIdToProjects < ActiveRecord::Migration
  def change
    add_column :projects, :planner_id, :integer
  end
end