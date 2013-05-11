class Project < ActiveRecord::Base
  attr_accessible :title

  has_many :project_users
  has_many :users, through: :project_users
end