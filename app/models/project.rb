class Project < ActiveRecord::Base
  attr_accessible :title, :users, :repo

  has_many :project_users
  has_many :users, through: :project_users
  has_one :repo
end