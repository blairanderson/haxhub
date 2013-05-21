class TravisService

  def self.new(owner_repo)
    Travis::Repository.find(owner_repo)
  end

end
