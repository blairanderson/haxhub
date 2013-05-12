class Repo < ActiveRecord::Base
  attr_accessible :project, :name, :url, :owner

  has_many :git_actions
  belongs_to :project

  def self.translate_all_to_ruby(repos)    
    repos.each do |repo|
      translate_to_ruby(repo)
    end
  end

  def self.translate_to_ruby(repo)
    Repo.create(
      name: repo.name,
      owner: repo.owner.login,
      url: repo.html_url)
  end

  def add_to_project(project)
    self.project = project
    self.save
    self
  end

  private

  # This needs to be likely reworked into new class
  def self.api_repos(user = current_user)
    Github.new(
      oauth_token: user.token,
      ssl: {:verify => false}).repos.all
  end
end