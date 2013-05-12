class Commit < ActiveRecord::Base
  attr_accesible :message

  belongs_to :repo
  belongs_to :author
end
