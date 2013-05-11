class AuthenticationController < ApplicationController

  def github_auth
    github_auth = GithubService.prepare

    github = Github.new(github_auth)

    redirect_to github.authorize_url
  end

  def github_callback
    github_auth = GithubService.prepare

    github = Github.new(github_auth)

    if params['code']
      access_token = github.get_token( params['code'] )
      github.oauth_token = access_token.token
      session[:github_token] = access_token.token
      user = github.users.find(self)

      new_user = User.find_or_create(user, access_token.token )

      session[:login] = new_user.login
    end

    redirect_to dashboard_path
  end

  def destroy
    session[:github_token] = nil
    session[:login] = nil
    redirect_to root_path
  end

end
