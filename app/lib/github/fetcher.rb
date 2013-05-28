module Github
  class Fetcher
    attr_reader :payload
    
    def initialize(input_payload)
      @payload = input_payload
    end

    def self.fetch(payload)
      new(payload).fetch 
    end

    def fetch
      Resque.enqueue(FetchGitActions, user.id, repo.id)
    end

    def repo
      Repo.where(
        name: payload['repository']['name'],
        owner: payload['repository']['owner']['name']
        ).first
    end

    def user
      login = payload["commits"][0]["committer"]["username"] || payload["commits"][0]["author"]["username"]
      User.where(login: login).first
    end
  end
end