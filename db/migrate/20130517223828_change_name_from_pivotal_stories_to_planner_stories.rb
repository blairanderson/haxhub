class ChangeNameFromPivotalStoriesToPlannerStories < ActiveRecord::Migration
  def change
    rename_table :pivotal_stories, :planner_stories
  end
end
