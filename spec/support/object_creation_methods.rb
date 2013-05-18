module ObjectCreationMethods
  def new_project(overrides = {})
    defaults = {title: "Project Title"}

    Project.new(defaults.merge(overrides))
  end

  def create_project(overrides = {})
    new_project(overrides).save!
  end

  def new_repo(overrides = {})
    defaults = {
      owner: "blairand",
      name: "alpha-feed-engine"
      }
    Repo.new(defaults.merge(overrides))
  end

  def create_repo(overrides = {})
    new_repo(overrides).save!
  end

  def new_user(overrides = {})
    defaults = {
      full_name: "Blair Anderson",
      login: 'blairand',
      token: '21fd512a9c68c223dc859eb4b2520e109b93abf1'
      }
    User.new(defaults.merge(overrides))
  end

  def create_user(overrides = {})
    new_user(overrides).save!
  end
end
