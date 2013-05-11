module AuthenticationHelper

  def auth_message
    if current_user
      link_to 'Logout', logout_path
    else
      link_to "Sign in with Github", github_auth_path
    end
  end

end
