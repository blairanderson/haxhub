class CreateCommits < ActiveRecord::Migration
  def change
    create_table :commits do |t|
      t.string :message
      t.integer :repo_id
      t.integer :author_id

      t.timestamps
    end
  end
end
