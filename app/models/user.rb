class User < ActiveRecord::Base
  attr_accessible :email, :full_name, 
                  :login, :token,
                  :projects, :search

  serialize :search, Array

  has_many :project_users
  has_many :projects, through: :project_users


  def duplicate_projects?(repo)
    projects.any?{|project| project.repo.id == repo.id}
  end

  def self.find_or_create(github, token)
    user = find_or_initialize_by_login(github.login,
                                      {full_name: github.name,
                                       email:     github.email,
                                       login:     github.login})
    user.token = token
    user.save
    user
  end


  def repos ### this should be moved to background job and stored in a string for the user. 
    if self.search.nil?
      self.search = Github.new(
            oauth_token: token,
      ssl: {:verify => false}).repos.all.map(&:html_url).to_json
    end
  end

  def self.find_or_create_from_token(oauth_code)
    user, token = GithubService.current_user(oauth_code)
    User.find_or_create( user, token )
  end
end
