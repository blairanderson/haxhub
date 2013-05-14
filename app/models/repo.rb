class Repo < ActiveRecord::Base
  attr_accessible :projects, :name, :owner

  has_many :git_actions
  has_many :projects

  validates_presence_of :owner, :name

  def self.create_from_github(input = "")
    owner, name = user_and_repo_from_string(input)
    repo = Repo.where(
      owner: owner, 
      name: name
      ).first_or_create
  end

private

  def self.user_and_repo_from_string(input='')
    result = '' if input == nil
    result = input.gsub('https://github.com/', '')
    result = result.gsub('git@github.com:', '')
    result = result.gsub('git://github.com/', '')
    result = result.gsub('.git', '')

    result.split('/')
  end

end
