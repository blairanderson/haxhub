# HaxHub

_a gSchool project by Blair Anderson, James Denman, Geoffrey Schorkopf and Jorge Tellez_

### View the Live Site

There is currently no production site for this app.

### Installing Softline

Once you've git cloned this repo, make sure to run

```bundle install``` to load the gems used in this project.

Next, run ```rake db:migrate``` to setup your local database

Then, to view the site from your computer, you can then run ```foreman start  -p 3000``` to view it at http://localhost:3000.


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

blairand
gschork
novohispano 
xacaxulu
