module ObjectCreationMethods

  def new_ci_source(overrides = {})
    defaults = {name: "testrepo", owner: "blairtest", active:false}

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
      owner: "blairtest",
      name: "testrepo"
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
      full_name: "blair",
      login: 'blairtest',
      token: ENV['GITHUB_B_AUTH']
      }
    User.new(defaults.merge(overrides))
  end

  def create_user(overrides = {})
    user = new_user(overrides)
    user.save
    user
  end

  def new_activity(overrides = {})
    defaults = {
      description: "I'm an activity!"
      }
    Activity.new(defaults.merge(overrides))
  end

  def create_activity(overrides = {})
    activity = new_activity(overrides)
    activity.save
    activity
  end
end
