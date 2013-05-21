class AddHook
  include Rails.application.routes.url_helpers

  @queue = :hooks

  def self.perform(user_id,repo_id)
    puts webhook_url

    user = User.find(user_id)
    repo = Repo.find(repo_id)

    github = GithubService.user_connection(user)
    additional_parameters = {"name" =>  "web", "active" => true, "config" => {"url" => webhook_url}}
    github.repos.hooks.create repo.owner, repo.name, additional_parameters
  end

end
