# encoding: UTF-8
# This file is auto-generated from the current state of the database. Instead
# of editing this file, please use the migrations feature of Active Record to
# incrementally modify your database, and then regenerate this schema definition.
#
# Note that this schema.rb definition is the authoritative source for your
# database schema. If you need to create the application database on another
# system, you should be using db:schema:load, not running all the migrations
# from scratch. The latter is a flawed and unsustainable approach (the more migrations
# you'll amass, the slower it'll run and the greater likelihood for issues).
#
# It's strongly recommended to check this file into your version control system.

ActiveRecord::Schema.define(:version => 20130520202123) do

  create_table "activities", :force => true do |t|
    t.integer  "activity_id"
    t.string   "author"
    t.string   "description"
    t.string   "event_type"
    t.datetime "occurred_at"
    t.integer  "planner_id"
    t.datetime "created_at",  :null => false
    t.datetime "updated_at",  :null => false
    t.string   "requester"
    t.string   "message"
    t.string   "story_type"
    t.integer  "points"
    t.integer  "story_id"
    t.string   "status"
    t.string   "url"
  end

  create_table "authors", :force => true do |t|
    t.string   "login"
    t.string   "full_name"
    t.datetime "created_at", :null => false
    t.datetime "updated_at", :null => false
    t.string   "avatar_url"
  end

  create_table "ci_sources", :force => true do |t|
    t.string   "name"
    t.string   "owner"
    t.boolean  "active"
    t.datetime "created_at", :null => false
    t.datetime "updated_at", :null => false
  end

  create_table "git_actions", :force => true do |t|
    t.string   "message"
    t.integer  "repo_id"
    t.integer  "author_id"
    t.datetime "created_at", :null => false
    t.datetime "updated_at", :null => false
    t.string   "type"
    t.string   "url"
    t.datetime "event_at"
  end

  create_table "planners", :force => true do |t|
    t.string   "name"
    t.integer  "project_id"
    t.datetime "created_at", :null => false
    t.datetime "updated_at", :null => false
    t.integer  "pivotal_id"
  end

  create_table "project_users", :force => true do |t|
    t.integer  "user_id",    :null => false
    t.integer  "project_id", :null => false
    t.datetime "created_at", :null => false
    t.datetime "updated_at", :null => false
  end

  create_table "projects", :force => true do |t|
    t.string   "title"
    t.datetime "created_at",   :null => false
    t.datetime "updated_at",   :null => false
    t.integer  "repo_id"
    t.integer  "planner_id"
    t.integer  "ci_source_id"
  end

  add_index "projects", ["ci_source_id"], :name => "index_projects_on_ci_source_id"

  create_table "repos", :force => true do |t|
    t.datetime "created_at", :null => false
    t.datetime "updated_at", :null => false
    t.string   "name"
    t.string   "owner"
  end

  create_table "test_builds", :force => true do |t|
    t.integer  "build_id"
    t.string   "state"
    t.datetime "finished"
    t.integer  "duration"
    t.string   "message"
    t.string   "config"
    t.string   "commit"
    t.string   "compare"
    t.string   "author"
    t.string   "committer"
    t.integer  "ci_source_id"
    t.datetime "created_at",   :null => false
    t.datetime "updated_at",   :null => false
  end

  add_index "test_builds", ["ci_source_id"], :name => "index_test_builds_on_ci_source_id"

  create_table "users", :force => true do |t|
    t.string   "login"
    t.string   "full_name"
    t.string   "email"
    t.datetime "created_at", :null => false
    t.datetime "updated_at", :null => false
    t.string   "token"
  end

end
