class AddNameAndUrlAndOwnerToRepos < ActiveRecord::Migration
  def change
    add_column :repos, :name, :string
    add_column :repos, :url, :string
    add_column :repos, :owner, :string
  end
end
