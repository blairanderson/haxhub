class CreatePivotalStories < ActiveRecord::Migration
  def change
    create_table :pivotal_stories do |t|
      t.string :message
      t.string :project
      t.string :requester

      t.timestamps
    end
  end
end
