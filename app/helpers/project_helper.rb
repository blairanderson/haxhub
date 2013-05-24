module ProjectHelper
  def checked?(project)
    begin
      project.ci_source.active == true ? "checked" : nil
    rescue
      project.add_ci_source
      nil
    end
  end

  def github_url(repo)
    "http://github.com/#{repo.owner}/#{repo.name}"
  end
end
