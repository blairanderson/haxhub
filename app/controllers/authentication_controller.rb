class AuthenticationController < ApplicationController

  def github_auth
    github = Github.new(Github::Service.prepare)
    redirect_to github.authorize_url(GithubAuth.params)
  end

  def github_callback
    if params['code']
      user = User.find_or_create_from_token(params[:code])
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
    user.repos
  end

end
