class GitAction < ActiveRecord::Base
  attr_accessible :message, :repo, :author, :url

  belongs_to :repo
  belongs_to :author

  def self.fetch_all_commits(user, repo)
    github = Github.new(
      oauth_token: user.token,
      ssl: {:verify => false})
    commits = github.repos.commits.all(repo.owner, repo.name)
    build_commits(repo, commits)
  end

  def self.build_commits(repo, commits)
    commits.collect do | commit |
      action      = build_commit(commit)
      action.repo = repo
      action.save
    end
  end

private
  def self.build_commit(commit)
    message = commit.commit.message
    url     = commit.html_url
    GitAction.where(message: message, url: url).first_or_create
  end
end
