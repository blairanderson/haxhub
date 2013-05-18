class UpdateRepo
  @queue = :work

  def self.perform(repo_id)
    repo = Repo.find(repo_id)
    Repo.fetch_new_commits(repo)
  end

end
