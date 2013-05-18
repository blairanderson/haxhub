class UpdateRepo
  @queue = :work

  def self.perform(repo_id)
    repo = Repo.find(repo_id)
    puts "found repo ID: #{repo.id} with #{repo.git_actions.count}"
    Repo.fetch_new_commits(repo)
    puts "Now repo has#{repo.git_actions.count}"
  end

end
