class Repo < ActiveRecord::Base
  has_many :commits
end
