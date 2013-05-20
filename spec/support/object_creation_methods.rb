module ObjectCreationMethods

  def new_ci_source(overrides = {})
    defaults = {name: "alpha-feed-engine", owner: "blairand", active:false}

    CiSource.new(defaults.merge(overrides))  
  end

  def create_ci_source(overrides = {})
    ci_source = new_ci_source(overrides)
    ci_source.save
    ci_source
  end

  def new_project(overrides = {})
    defaults = {title: "Project Title"}

    Project.new(defaults.merge(overrides))
  end

  def create_project(overrides = {})
    project = new_project(overrides)
    project.save
    project
  end

  def new_repo(overrides = {})
    defaults = {
      owner: "blairand",
      name: "alpha-feed-engine"
      }
    Repo.new(defaults.merge(overrides))
  end

  def create_repo(overrides = {})
    repo = new_repo(overrides)
    repo.save
    repo
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
    user = new_user(overrides)
    user.save
    user
  end

  def new_story(overrides = {})
    defaults = {
      message: "I'm a story!"
      }
    Story.new(defaults.merge(overrides))
  end

  def create_story(overrides = {})
    story = new_story(overrides)
    story.save
    story
  end
end
