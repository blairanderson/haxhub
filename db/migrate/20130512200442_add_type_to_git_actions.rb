class AddTypeToGitActions < ActiveRecord::Migration
  def change
    add_column :git_actions, :type, :string
  end
end
