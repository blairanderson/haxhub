class CreateRepos < ActiveRecord::Migration
  def change
    create_table :repos do |t|

      t.timestamps
    end
  end
end
