class AddColumnsUrlStatusTypePointsAndStoryId < ActiveRecord::Migration
  def change
    add_column :stories, :url, :string
    add_column :stories, :status, :string
    add_column :stories, :type, :string
    add_column :stories, :points, :integer, default: 0
    add_column :stories, :story_id, :integer
  end
end
