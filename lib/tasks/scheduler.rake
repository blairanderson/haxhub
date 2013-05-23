desc "This task is called by the Heroku scheduler add-on"
task :update_feeds => :environment do
  puts "Updating Repo Feeds..."
  Repo.all.each do |repo|
    Resque.enqueue(UpdateRepo, repo.id)
  end
  puts "scheduled jobs for repos"

  puts "Updating Pivotal Feeds..."
  Planner.all.each do |planner|
    Resque.enqueue(FetchActivities,planner.id, 0)
  end
  puts "scheduled jobs for planners"

  puts "Updating Builds"
  CiSource.all.each do |source|
    Resque.enqueue(FetchCiBuilds, source.id)
  end
  puts "scheduled jobs for sources"
  Project.where(ci_source_id: nil).all.each(&:add_ci_source)
end
