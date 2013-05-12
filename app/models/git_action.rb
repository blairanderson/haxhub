class GitAction < ActiveRecord::Base
  attr_accessible :message, :repo, :author

  belongs_to :repo
  belongs_to :author
end
