class UpdateRepo
  @queue = :updates

  def self.perform(repo_id)
    repo = Repo.find(repo_id)
    count = repo.git_actions.count
    Repo.fetch_new_commits(repo)
    puts "Found #{repo.git_actions.count - count}"
  end

end
