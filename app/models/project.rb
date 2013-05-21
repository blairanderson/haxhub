class Project < ActiveRecord::Base
  attr_accessible :title,
                  :users,
                  :repo,
                  :planner,
                  :ci_source

  has_many :project_users
  has_many :users, through: :project_users

  belongs_to  :repo
  belongs_to  :planner
  belongs_to  :ci_source

  def self.create_with_repo(params, user)
    params[:checked] ? value = :on : value = :off
    repo = Repo.create_from_github(params[:repo_name_owner])

    if repo
      unless user.duplicate_projects?(repo)
        project = user.projects.create(title: repo.name, repo: repo)
        Resque.enqueue(AddHook, user.id, repo.id)
        project.add_ci_source
        project.ci_source.build_status(value)
      end
      Resque.enqueue(FetchGitActions, user.id, repo.id)
    else
      return false
    end
  end

  def add_ci_source
    new_ci_source = CiSource.where(name: self.repo.name,
                                   owner: self.repo.owner).first_or_create
    new_ci_source.active = false
    new_ci_source.save
    self.ci_source = new_ci_source
    self.save
    self
  end

  def add_planner(pivotal_id)
    planner = Project.build_planner(pivotal_id)
    self.planner = planner
    self.save
    self
  end

  private

  def self.build_planner(pivotal_id)
    Planner.build_planner(pivotal_id)
  end
end
