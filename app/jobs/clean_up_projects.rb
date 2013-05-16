class CleanUpProjects
  @queue = :work

  def self.perform(project_id)
    puts "this is radical"
  end

end
