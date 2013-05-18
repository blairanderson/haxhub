class FetchGitActions
  @queue = :work

  def self.perform(user_id, repo_id)
    user = User.find(user_id)
    repo = Repo.find(repo_id)
    GitAction.fetch_all_commits(user, repo)  
  end

end
