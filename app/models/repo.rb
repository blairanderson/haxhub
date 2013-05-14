class Repo < ActiveRecord::Base
  attr_accessible :projects, :name, :owner

  has_many :git_actions
  has_many :projects

  validates_presence_of :owner, :name

  def self.create_from_github(input = "")
    owner, name = user_and_repo_from_string(input)
    if owner && name
      repo = Repo.where(
        owner: owner, 
        name: name
        ).first_or_create
    else
      return false
    end
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

  # private

  # # This needs to be likely reworked into new class
  # # Example use in rails console:
  # # repos = Repo.api_repos(User.last)
  # def self.api_repos(user = current_user)
  #   Github.new(
  #     oauth_token: user.token,
  #     ssl: {:verify => false}).repos.all
  # end
end
