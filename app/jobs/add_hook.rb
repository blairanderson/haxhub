class AddHook
  @queue = :hooks

  def self.perform(user_id,repo_id)
    user = User.find(user_id)
    repo = Repo.find(repo_id)

    github = Github::Service.user_connection(user)
    additional_parameters = {"name" =>  "web", "active" => true, "config" => {"url" => "http://haxhub.herokuapp.com/webhook"}}
    github.repos.hooks.create repo.owner, repo.name, additional_parameters
  end

end
