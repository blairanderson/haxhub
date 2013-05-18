web: bundle exec unicorn -p $PORT
redis: redis-server
worker: bundle exec rake environment resque:work QUEUE=work
