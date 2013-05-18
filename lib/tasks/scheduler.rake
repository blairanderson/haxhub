desc "This task is called by the Heroku scheduler add-on"
task :update_feeds => :environment do
  puts "Updating feed..."
  Repo.all.each do |repo|
    Resque.enqueue(UpdateRepo, repo.id)
  end
  puts "done."
end
