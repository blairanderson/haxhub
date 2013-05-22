class AddDefaultValuesToTestBuilds < ActiveRecord::Migration
  def change
    change_column :test_builds, :author,   :string, :default => "Guest"
    change_column :test_builds, :commit,   :integer, :default => 1
    change_column :test_builds, :committer, :string, :default => "Guest"
    change_column :test_builds, :compare,   :string, :default => "http://haxhub.herokuapp.com" 
    change_column :test_builds, :config,   :string, :default => "config"
    change_column :test_builds, :duration, :integer, :default => 1
    change_column :test_builds, :message, :string, :default => "Great Commit"
    change_column :test_builds, :state, :string,  :default => "pending"
  end
end
