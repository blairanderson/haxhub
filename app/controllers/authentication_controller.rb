class AuthenticationController < ApplicationController

  def github_auth
    if Rails.env.production?
      auth_setup = {
        :redirect_uri => "http://haxhub.herokuapp.com/auth/github/callback",
        :scope => "public_repo"
      }
    else
      auth_setup = {:scope => 'public_repo'}
    end
    github = Github.new(GithubService.prepare)
    redirect_to github.authorize_url(auth_setup)
  end

  def github_callback

    if params['code']
      user = User.find_or_create_from_token(params[:code])
      user.repos
      login(user) 
    end

    redirect_to dashboard_path
  end

  def destroy
    session[:login] = nil
    redirect_to root_path
  end

private

  def login(user)
    session[:login] = user.login
  end

end
