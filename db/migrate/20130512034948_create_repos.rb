class CreateRepos < ActiveRecord::Migration
  def change
    create_table :repos do |t|
      t.integer :project_id

      t.timestamps
    end
  end
end
