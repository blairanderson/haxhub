class ChangeNameFromPlannerStoriesToStories < ActiveRecord::Migration
  def change
    rename_table :planner_stories, :stories
  end
end
