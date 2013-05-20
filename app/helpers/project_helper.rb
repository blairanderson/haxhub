module ProjectHelper

  def value_for_checkbox(project)
    if project.ci_source.active?
      false
    else
      true
    end
  end

  def checked?(project)
    if project.ci_source.active?
      "checked"
    else
      nil
    end
  end
end
