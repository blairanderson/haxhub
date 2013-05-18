class RemoveProjectIdFromRepos < ActiveRecord::Migration
  def change
    remove_column :repos, :project_id    
  end
end
