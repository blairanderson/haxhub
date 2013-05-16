desc "This task is called by the Heroku scheduler add-on"
task :update_feed => :environment do
  puts "Updating feed..."
  Rescue.enqueue(TestPuts)
  puts "done."
end

task :fill_projects_with_repo_info => :environment do
  Project.where(user_name: nil, repo_name: nil).each do |project|
    Resque.enqueue(CleanUpProjects, project.id)
  end
end
