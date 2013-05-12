class AddRepoIdToProject < ActiveRecord::Migration
  def change
    add_column :projects, :repo_id, :integer
  end
end
