class CiSource < ActiveRecord::Base
  attr_accessible :active, :name, :owner, :projects

  has_many :projects
  has_many :test_builds
  validates_presence_of :owner, :name

  def activate
    self.update_attributes(active: true)
  end

  def fetch_all_test_builds
    travis_repo = TravisService.new("#{owner}/#{name}")
    travis_repo.recent_builds.collect do |test_build|
      TestBuild.create_from(test_build, id)
    end
  end
end
