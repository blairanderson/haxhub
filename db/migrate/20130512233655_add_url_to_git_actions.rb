class AddUrlToGitActions < ActiveRecord::Migration
  def change
    add_column :git_actions, :url, :string
  end
end
