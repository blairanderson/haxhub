class DropStoriesTableCreateActivitiesTable < ActiveRecord::Migration
  def change
    drop_table :stories

    create_table :activities do |t|
      t.integer    :activity_id
      t.string     :author
      t.string     :description
      t.string     :event_type
      t.datetime   :occurred_at
      t.references :planner

      t.timestamps
    end
  end
end
