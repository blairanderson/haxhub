class AuthenticationController < ApplicationController

  def github
    client_id = '81d9e96eebf415c911d1'
    redirect_uri = github_redirect_url

    redirect_to "https://github.com/login/oauth/authorize?client_id=#{client_id}&redirect_uri=#{redirect_uri}"  
  end

  def github_redirect
      client_id = '81d9e96eebf415c911d1'
      client_secret = "f539d89fc3d4735ed65d827db173fa778d9fdb84"
      redirect_uri = "http://53ek.localtunnel.com"+github_redirect_path
    
    if params[:code]
      uri = "https://github.com/login/oauth/access_token?client_id=#{client_id}&redirect_uri=#{redirect_uri}&client_secret=#{client_secret}&code=#{params[:code]}"
      response = Net::HTTP.post_form uri
    end
  end

end
