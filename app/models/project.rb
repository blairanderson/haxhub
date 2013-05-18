class Project < ActiveRecord::Base
  attr_accessible :title,
                  :users,
                  :repo,
                  :planner

  has_many :project_users
  has_many :users, through: :project_users
  belongs_to  :repo
  belongs_to  :planner

  def self.create_with_repo(repo_url, user)
    repo = Repo.create_from_github(repo_url)
    if repo
      unless user.duplicate_projects?(repo)
        user.projects.create(title: repo.name, repo: repo)
      end
      Resque.enqueue(FetchGitActions, user.id, repo.id)
    else
      return false
    end
  end

  def self.add_planner(project_id, planner_id)
    project = Project.find(project_id)
    project.planner = build_planner(planner_id)
  end

  private

  def self.build_planner(planner_id)
    Planner.build_planner(planner_id)
  end
end
