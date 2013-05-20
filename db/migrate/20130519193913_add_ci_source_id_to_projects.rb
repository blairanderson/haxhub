class AddCiSourceIdToProjects < ActiveRecord::Migration
  def change
    add_column :projects, :ci_source_id, :integer
    add_index :projects, :ci_source_id
  end
end
