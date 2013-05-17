class Planner < ActiveRecord::Base
  attr_accessible :name

  has_many :projects
  has_many :pivotal_stories
end
