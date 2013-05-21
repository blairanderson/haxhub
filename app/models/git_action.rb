class GitAction < ActiveRecord::Base
  attr_accessible :message,
                  :repo,
                  :author,
                  :url,
                  :event_at

  belongs_to :repo
  belongs_to :author

  default_scope order('event_at DESC')

  def self.fetch_all_commits(user, repo)
    github = GithubService.user_connection(user)
    commits = github.repos.commits.all(repo.owner, repo.name)
    build_commits(repo, commits)
  end


  def self.build_commits(repo, commits)
    commits.collect do | commit |
      action      = build_commit(commit)
      action.repo = repo
      action.save
    end
  end

private

  def self.build_author(commit)
    login, full_name, avatar_url = gather_author_attributes(commit)
    author = Author.where( login: login ).first_or_create

    author.attributes(full_name: full_name, avatar_url: avatar_url)

    author.save
    author
  end

  def self.gather_author_attributes(commit)
    login = fetch_login(commit)
    full_name = fetch_full_name(commit)
    avatar_url = fetch_full_name(commit)
    [login, full_name, avatar_url]
  end

  def self.fetch_avatar_url(commit)
    commit.committer.avatar_url
  end

  def self.fetch_full_name(commit)
    commit.commit.committer.name
  end

  def self.fetch_login(commit)
    commit.committer.login
  end

  def self.build_from_payload(payload)

        author = Author.build_author_from_commit(commit)
    url    = commit.html_url
    action = GitAction.where(
      url: commit_url,#The url for the commit
      author_id: author.id #the ID of the author after the author has been found or created above. 
      ).first_or_create
    action.event_at = #the commit date
    action.message = #the commit message
    payloads["commits"]

    {
  :before     => before,
  :after      => after,
  :ref        => ref,
  :commits    => [{
    :id        => commit.id,
    :message   => commit.message,
    :timestamp => commit.committed_date.xmlschema,
    :url       => commit_url,
    :added     => array_of_added_paths,
    :removed   => array_of_removed_paths,
    :modified  => array_of_modified_paths,
    :author    => {
      :name  => commit.author.name,
      :email => commit.author.email
    }
  }],
  :repository => {
    :name        => repository.name,
    :url         => repo_url,
    :pledgie     => repository.pledgie.id,
    :description => repository.description,
    :homepage    => repository.homepage,
    :watchers    => repository.watchers.size,
    :forks       => repository.forks.size,
    :private     => repository.private?,
    :owner => {
      :name  => repository.owner.login,
      :email => repository.owner.email
    }
  }
}
  end

  def self.build_commit(commit)
    author = Author.build_author_from_commit(commit)
    url    = commit.html_url
    action = GitAction.where(url: url, author_id: author.id).first_or_create
    action.event_at = DateTime.parse(commit.commit.author.date)
    action.message = commit.commit.message
    action.save
    action 
  end
end
