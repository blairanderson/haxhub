class Repo < ActiveRecord::Base
  attr_accessible :project

  has_many :git_actions
  belongs_to :project

  def self.translate_to_ruby(user)
    github = Github.new()
    user.token
    Repo.create(project: Project.create)
  end
end

