class TestBuildsController < ApplicationController
  before_filter :load_ci_source

  def index
    if @ci_source
      @test_builds = @ci_source.test_builds.where('started > ?', DateTime.parse(params[:before])+(1.seconds))
      @test_builds.reverse!
    else
      @test_builds = []
    end
  end

private
  def load_ci_source
    @ci_source = current_user.projects.find(params[:project_id]).ci_source
  end
end
