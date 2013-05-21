class CiSource < ActiveRecord::Base
  attr_accessible :active, :name, :owner, :projects

  has_many :projects
  has_many :test_builds
  validates_presence_of :owner, :name

  def activate
    Resque.enqueue(FetchCiBuilds, self.id) if self.test_builds.empty?
    self.update_attributes(active: true)
  end

  def deactivate
    self.update_attributes(active: false)
  end

  def status_to_s
    active == true ? "activated" : "deactivated"
  end

  def build_status(value)
    value == :off ? deactivate : activate
  end

  def fetch_all_test_builds
    travis_repo = TravisService.new("#{owner}/#{name}")
    travis_repo.recent_builds.collect do |test_build|
      TestBuild.create_from(test_build, id)
    end
  end
  
end
