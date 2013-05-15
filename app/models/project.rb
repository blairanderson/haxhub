class Project < ActiveRecord::Base
  attr_accessible :title, :users, :repo

  has_many :project_users
  has_many :users, through: :project_users
  belongs_to :repo

  def self.create_with_repo(repo_url, user)
    repo = Repo.create_from_github(repo_url)
    unless user.duplicate_projects?(repo)
      user.projects.create(title: repo.name, repo: repo)
    end

    GitAction.fetch_all_commits(user, repo) # this should be in a background job
  end
end
