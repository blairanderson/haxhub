class FetchCiBuilds
  @queue = :updates

  def self.perform(ci_source_id)
    ci_source = CiSource.find(ci_source_id)
    begin
    ci_source.fetch_all_test_builds
    rescue
      #do some stuff
    end
  end
end
