require 'spec_helper'

describe DashboardHelper do
  describe "#get_initials" do
    it "returns a person's initials" do
      initials = get_initials("Jorge Tellez")
      expect(initials).to eq "<span class=\"initials\">JT</span>"
    end
  end
end