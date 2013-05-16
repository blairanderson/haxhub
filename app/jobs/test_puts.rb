class TestPuts
  @queue = :work

  def self.perform
    puts "Woohoo #{Time.new}"
  end

end
