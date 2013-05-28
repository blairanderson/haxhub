# HaxHub

[![Code Climate](https://codeclimate.com/github/blairand/alpha-feed-engine.png)](https://codeclimate.com/github/blairand/alpha-feed-engine)
[![Coverage Status](https://coveralls.io/repos/blairand/alpha-feed-engine/badge.png)](https://coveralls.io/r/blairand/alpha-feed-engine)
[![Build Status](https://travis-ci.org/blairand/alpha-feed-engine.png)](https://travis-ci.org/blairand/alpha-feed-engine)

_a gSchool project by Blair Anderson, Geoffrey Schorkopf and Jorge Tellez_

### View the Live Sity

There is currently no production site for this app.

### Installing Haxhub

Once you've git cloned this repo, make sure to RUN

```bundle install``` to load the gems used in this project.


Next, run ```rake db:migrate``` to setup your local DB

To view the site from your computer, you can then run ```redis-server``` and  ```foreman start  -p 3000``` to view it at http://localhost:3000.


### Introduction

HaxHub is a Rails app which integrates the APIs of Github, Pivotal Tracker, and Travis CI to serve as an all-in-one software project feed.

The background requirements for this project can be found at: http://tutorials.jumpstartlab.com/projects/feed_engine.html.

HaxHub-specific requirements can be found at: http://tutorials.jumpstartlab.com/projects/feed_engine_concepts.html under the heading "Softline."


### Run Our Test Suite

Make sure to run:

``` rake db:test:prepare```

to setup your test database. Then run:

``` bundle exec rspec```

### Tweet Us, Y'all

* [blairand](https://twitter.com/blairand)
* [gschork](https://twitter.com/gschork)
* [novohispano](https://twitter.com/novohispano)
