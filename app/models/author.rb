class Author < ActiveRecord::Base
  attr_accessible :full_name, :login, :avatar_url

  has_many :git_actions
end
