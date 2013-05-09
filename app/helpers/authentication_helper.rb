module AuthenticationHelper

  def github
    if session[:github_token]
      "Logged in as 'username'. #{link_to 'logout?', logout_path}".html_safe
    else
      link_to "Sign In with Github", github_auth_path
    end
  end

end
