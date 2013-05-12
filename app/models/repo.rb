class Repo < ActiveRecord::Base
  attr_accessible :project

  has_many :commits
  belongs_to :project
end
