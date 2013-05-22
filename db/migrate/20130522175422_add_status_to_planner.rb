class AddStatusToPlanner < ActiveRecord::Migration
  def change
    add_column :planners, :status, :string, :default => "pending"
  end
end
