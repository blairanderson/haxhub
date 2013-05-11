# Softline (name pending)
_a gSchool project by Blair Anderson, James Denton, Geoffrey Schorkopf and Jorge Tellez_

### Introduction

Softline is an app which integrates the APIs of Github, Pivotal Tracker, and Travis CI to serve an all-in-one software project feed.

The background requirements for this project can be found at: http://tutorials.jumpstartlab.com/projects/feed_engine.html

Softline-specific requirements can be found at: http://tutorials.jumpstartlab.com/projects/feed_engine_concepts.html

### View the Live Site

There is currently no production site for this app.

### Installing Softline

Once you've git cloned this repo, make sure to run

```bundle install``` to load the gems used in this project

Then, to view the site from your computer, you can then run ```unicorn``` to view it at http://localhost:8080.

### To Run Rspec Tests on the Code

Make sure to run:

``` rake db:test:prepare```

to setup your test database.