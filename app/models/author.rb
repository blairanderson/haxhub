class Author < ActiveRecord::Base
  attr_accessible :full_name, :login, :gravatar_url

  has_many :git_actions
end
