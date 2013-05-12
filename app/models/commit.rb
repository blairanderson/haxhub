class Commit < ActiveRecord::Base
  attr_accesible :message

  belongs_to :repo
  
end
