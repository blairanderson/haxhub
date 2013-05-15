require 'spec_helper'

describe Author do 
  describe '.build_author_from_commit' do 
    it 'should find first author or create one' do
      commit = ""
      Author.stub(:fetch_login).and_return("novohispano") 
      Author.stub(:fetch_avatar_url).and_return("http://placehold.it/50/50") 
      Author.stub(:fetch_full_name).and_return("The King of Poptarts")
      author = Author.build_author_from_commit(commit)
      expect( author.class ).to eq Author
    end
  end
end
