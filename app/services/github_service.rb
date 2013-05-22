class GithubService
  
  def self.prepare(params = {})
    github_auth = {}
    github_auth[:client_id] = ENV['GITHUB_ID']
    github_auth[:client_secret] = ENV['GITHUB_SECRET']
    github_auth[:ssl] = {:verify => false}
    if params[:github_token]
      github_auth[:oauth_token] = params[:github_token]
    end
    github_auth
  end

  def self.connection
    Github.new(GithubService.prepare)
  end

  def self.user_connection(user)
    Github.new(GithubService.prepare(github_token: user.token))
  end

  def self.current_user(oauth_code)
    github = connection
    github.oauth_token = github.get_token( oauth_code ).token
    [github.users.get, github.oauth_token]
  end
end
