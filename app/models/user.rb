class User < ActiveRecord::Base
  attr_accessible :email, :full_name, 
                  :login, :token,
                  :projects, :search

  serialize :search

  has_many :project_users
  has_many :projects, through: :project_users


  def duplicate_projects?(repo)
    projects.any?{|project| project.repo.id == repo.id}
  end

  def self.find_or_create(github, token)
    github.name ? full_name = github.name : full_name = "Guest"
    github.email ? email = github.email : email = "guest@example.com"

    user = find_or_initialize_by_login(github.login,
                                      {full_name: full_name,
                                       email:     email,
                                       login:     github.login})
    user.token = token
    user.save
    user
  end


  def repos 
    self.search = Github.new(
          oauth_token: token,
    ssl: {:verify => false}).repos.all.map(&:html_url).to_json
    self.save
  end

  def self.find_or_create_from_token(oauth_code)
    user, token = Github::Service.current_user(oauth_code)
    User.find_or_create( user, token )
  end
end
