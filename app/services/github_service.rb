class GithubService

  def self.prepare(params = {})
    github_auth = {}
    if Rails.env == "production"
      github_auth[:redirect_uri] = github_callback_url
    end
    github_auth[:client_id] = ENV['GITHUB_ID']
    github_auth[:client_secret] = ENV['GITHUB_SECRET']
    github_auth[:ssl] = {:verify => false}
    if params[:github_token]
      github_auth[:oauth_token] = params[:github_token]
    end
    github_auth
  end
  
end
