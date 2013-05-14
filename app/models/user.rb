class User < ActiveRecord::Base
  attr_accessible :email, :full_name, 
                  :login, :token,
                  :projects

  has_many :project_users
  has_many :projects, through: :project_users


  def duplicate_projects?(repo)
    projects.any?{|project| project.repo.id == repo.id}
  end

  def self.find_or_create(github, token)
    unless user = find_by_login(github.login)
      user = new(
        full_name: github.name,
        email:     github.email,
        login:     github.login
        )
    end

    user.token = token
    user.save
    user
  end


  def repos ### this should be moved to background job and stored in a string for the user. 
    Github.new(
      oauth_token: token,
      ssl: {:verify => false}).repos.all.map(&:html_url).to_json
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
