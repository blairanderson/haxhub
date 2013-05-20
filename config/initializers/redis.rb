redis_url = ENV["REDISTOGO_URL"] ||= "redis://localhost:6379"

uri = URI.parse(redis_url)
REDIS = Redis.new(:host => uri.host, :port => uri.port, :password => uri.password) 

Dir["#{Rails.root}/app/jobs/*.rb"].each { |file| require file }
