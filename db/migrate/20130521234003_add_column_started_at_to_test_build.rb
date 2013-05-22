class AddColumnStartedAtToTestBuild < ActiveRecord::Migration
  def change
    add_column :test_builds, :started, :datetime
  end
end
