class AuthenticationController < ApplicationController

  def github
    client_id = '81d9e96eebf415c911d1'
    redirect_uri = github_redirect_url
    client_secret = "f539d89fc3d4735ed65d827db173fa778d9fdb84"

    github = Github.new(
      :client_id => client_id,
      :client_secret => client_secret,
      :ssl => {:verify => false}
      )

    redirect_to github.authorize_url #in production send redirect_url
  end

  def github_redirect
    client_id = '81d9e96eebf415c911d1'
    redirect_uri = github_redirect_url
    client_secret = "f539d89fc3d4735ed65d827db173fa778d9fdb84"

    github = Github.new(
      :client_id => client_id,
      :client_secret => client_secret,
      :ssl => {:verify => false}
      )

    if params['code']
      token = github.get_token( params['code'] )
    end
    session[:github_token] = token.token
    redirect_to root_path, notice: "You just gave us your soul... "
  end

  def destroy
    session[:github_token] = nil
    redirect_to root_path
  end

end
