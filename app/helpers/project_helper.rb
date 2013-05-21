module ProjectHelper
  def checked?(project)
    project.ci_source.active == true ? "checked" : nil
  end
end
