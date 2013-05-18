class GitAction < ActiveRecord::Base
  attr_accessible :message,
                  :repo,
                  :author,
                  :url

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

  def self.build_author(commit)
    login, full_name, avatar_url = gather_author_attributes(commit)
    author = Author.where( login: login ).first_or_create

    author.attributes(full_name: full_name, avatar_url: avatar_url)

    author.save
    author
  end

  def self.gather_author_attributes(commit)
    login = fetch_login(commit)
    full_name = fetch_full_name(commit)
    avatar_url = fetch_full_name(commit)
    [login, full_name, avatar_url]
  end

  def self.fetch_avatar_url(commit)
    commit.committer.avatar_url
  end

  def self.fetch_full_name(commit)
    commit.commit.committer.name
  end

  def self.fetch_login(commit)
    commit.committer.login
  end

  def self.build_commit(commit)
    author = Author.build_author_from_commit(commit)
    message = commit.commit.message
    url     = commit.html_url
    GitAction.where(message: message, url: url, author_id: author.id ).first_or_create
  end
end
