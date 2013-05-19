class AddPlannerIDtoPlannerStories < ActiveRecord::Migration
  def change
    add_column :planner_stories, :planner_id, :integer
  end
end
