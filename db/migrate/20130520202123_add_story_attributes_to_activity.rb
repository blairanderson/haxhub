class AddStoryAttributesToActivity < ActiveRecord::Migration
  def change
    change_table :activities do |t|
      t.string  :requester
      t.string  :message
      t.string  :story_type
      t.integer :points
      t.integer :story_id
      t.string  :status
      t.string  :url
    end
  end
end
