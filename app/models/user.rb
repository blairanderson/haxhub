class User < ActiveRecord::Base
  attr_accessible :email, :full_name, :login, :token

  has_many :project_users
  has_many :projects, through: :project_users

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


end
