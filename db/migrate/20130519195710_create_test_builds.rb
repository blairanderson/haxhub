class CreateTestBuilds < ActiveRecord::Migration
  def change
    create_table :test_builds do |t|
      t.integer :build_id
      t.string :state
      t.datetime :finished
      t.integer :duration
      t.string :message
      t.string :config
      t.string :commit
      t.string :compare
      t.string :author
      t.string :committer
      t.integer :ci_source_id

      t.timestamps
    end
    add_index :test_builds, :ci_source_id
  end
end
