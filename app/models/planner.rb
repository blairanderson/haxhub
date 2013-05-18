class Planner < ActiveRecord::Base
  attr_accessible :name

  has_many :projects
  has_many :planner_stories

  def self.build_planner(project_id)
    prepare_service
    planner = fetch_project(project_id)
    name    = planner.name
    new_planner = Planner.find_or_create_by_name(name)
    new_planner.planner_stories = PlannerStory.fetch_all_stories(planner)
    new_planner
  end

  private

  def self.prepare_service
    PivotalTrackerService.prepare
  end

  def self.fetch_project(project_id)
    PivotalTrackerService.project(project_id)
  end
end