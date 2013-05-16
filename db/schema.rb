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

ActiveRecord::Schema.define(:version => 20130516141302) do

  create_table "authors", :force => true do |t|
    t.string   "login"
    t.string   "full_name"
    t.datetime "created_at", :null => false
    t.datetime "updated_at", :null => false
    t.string   "avatar_url"
  end

  create_table "git_actions", :force => true do |t|
    t.string   "message"
    t.integer  "repo_id"
    t.integer  "author_id"
    t.datetime "created_at", :null => false
    t.datetime "updated_at", :null => false
    t.string   "type"
    t.string   "url"
  end

  create_table "project_users", :force => true do |t|
    t.integer  "user_id",    :null => false
    t.integer  "project_id", :null => false
    t.datetime "created_at", :null => false
    t.datetime "updated_at", :null => false
  end

  create_table "projects", :force => true do |t|
    t.string   "title"
    t.datetime "created_at", :null => false
    t.datetime "updated_at", :null => false
    t.string   "user_name"
    t.string   "repo_name"
    t.integer  "repo_id"
  end

  create_table "repos", :force => true do |t|
    t.datetime "created_at", :null => false
    t.datetime "updated_at", :null => false
    t.string   "name"
    t.string   "owner"
  end

  create_table "users", :force => true do |t|
    t.string   "login"
    t.string   "full_name"
    t.string   "email"
    t.datetime "created_at", :null => false
    t.datetime "updated_at", :null => false
    t.string   "token"
  end

end
