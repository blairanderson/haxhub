class Repo < ActiveRecord::Base
  attr_accessible :projects, :name, :owner

  has_many :git_actions
  has_many :projects

  validates_presence_of :owner, :name

  def self.fetch_new_commits(repo, limit = 30)
    github = Github::Service.connection
    
    commits = github.repos.commits.all(repo.owner, repo.name, per_page: limit)
    repo.verify_and_save_commits(commits)
  end

  def verify_and_save_commits(commits)
    commits.collect do | commit |
      action      = GitAction.build_commit(commit)
      action.repo = self
      action.save
    end
  end

  def self.create_from_github(input = "")
    owner, name = user_and_repo_from_string(input)
    if owner && name
      repo = Repo.where(
        owner: owner, 
        name: name
        ).first_or_create
    else
      return false
    end
  end

private

  def self.user_and_repo_from_string(input='')
    result = '' if input == nil
    result = input.gsub('https://github.com/', '')
    result = result.gsub('git@github.com:', '')
    result = result.gsub('git://github.com/', '')
    result = result.gsub('.git', '')

    result.split('/')
  end
end
