class RemoveProjectColumnFromStories < ActiveRecord::Migration
  def change
    remove_column :stories, :project
  end
end
