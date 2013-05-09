module AuthenticationHelper

  def auth_message
    if current_user
      "#{image_tag current_user.avatar_url} Logged in as #{current_user.name} | #{link_to 'Logout?', logout_path}".html_safe
    else
      link_to "Sign in with Github", github_auth_path
    end
  end

end
