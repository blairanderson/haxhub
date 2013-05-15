class Author < ActiveRecord::Base
  attr_accessible :full_name, :login, :avatar_url

  has_many :git_actions

  def self.build_author_from_commit(commit)
    login  = fetch_login(commit)
    author = Author.where(login: login).first_or_create

    author.full_name  = fetch_full_name(commit)
    author.avatar_url = fetch_avatar_url(commit)
    
    author.save
    author
  end

  def self.fetch_login(commit)
    commit.committer.login
  end

  def self.fetch_full_name(commit)
    commit.commit.committer.name
  end

  def self.fetch_avatar_url(commit)
    commit.committer.avatar_url
  end
end
