class GitAction < ActiveRecord::Base
  attr_accessible :message, :repo, :author, :url

  belongs_to :repo
  belongs_to :author

  def self.translate_all_to_ruby(git_actions)    
    git_actions.each do |git_action|
      translate_to_ruby(git_action)
    end
  end

  def self.translate_to_ruby(git_action)
    GitAction.create(
      message: git_action.commit.message,
      url: git_action.html_url)
      # How to deal with repo connection?
      # .find_or_create method for Author?
  end

  private

  # This needs to be likely reworked into new class
  # Example use in rails console:
  # commits = GitAction.api_commits(User.last, Repo.api_repos(User.last).first)
  def self.api_commits(user = current_user, repo)
    github = Github.new(
      oauth_token: user.token,
      ssl: {:verify => false})
    github.repos.commits.all repo.owner.login, repo.name
  end
end
