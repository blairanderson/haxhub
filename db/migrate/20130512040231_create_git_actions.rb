class CreateGitActions < ActiveRecord::Migration
  def change
    create_table :git_actions do |t|
      t.string :message
      t.integer :repo_id
      t.integer :author_id

      t.timestamps
    end
  end
end
