module AuthenticationHelper

  def auth_message
    if current_user
      "Logged in as #{current_user.full_name} | #{link_to 'Logout?', logout_path}".html_safe
    else
      link_to "Sign in with Github", github_auth_path
    end
  end

end
