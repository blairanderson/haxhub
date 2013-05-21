class AuthenticationController < ApplicationController

  def github_auth
    redirect_to github.authorize_url(:scope => 'public_repo')
  end

  def github_callback
    login( User.find_or_create_from_token(params[:code]) ) if params['code']
    redirect_to dashboard_path
  end

  def destroy
    session[:login] = nil
    redirect_to root_path
  end

private

  def github
    @github_connection ||= Github.new(GithubService.prepare)
  end

  def login(user)
    session[:login] = user.login
  end

end
