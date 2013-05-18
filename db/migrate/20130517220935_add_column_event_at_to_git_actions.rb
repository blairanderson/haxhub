class AddColumnEventAtToGitActions < ActiveRecord::Migration
  def change
    add_column :git_actions, :event_at, :datetime
  end
end
