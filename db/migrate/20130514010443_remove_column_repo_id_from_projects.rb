class RemoveColumnRepoIdFromProjects < ActiveRecord::Migration
  def change
    remove_column :projects, :repo_id
  end
end
