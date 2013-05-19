module ProjectHelper

  def value_for_checkbox(project)
    if project
      false
    else
      true
    end
  end

  def checked?(project)
    if project
      "checked"
    else
      nil
    end
  end

end
