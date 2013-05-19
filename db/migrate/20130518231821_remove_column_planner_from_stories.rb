class RemoveColumnPlannerFromStories < ActiveRecord::Migration
  def change
    remove_column :stories, :planner
  end
end
