class Repo < ActiveRecord::Base
  attr_accessible :project

  has_many :git_actions
  belongs_to :project
end
