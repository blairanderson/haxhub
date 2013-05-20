require 'spec_helper'

describe TestBuild do
  describe '.create_from' do 
    let(:test_build) do 
      OpenStruct.new({'commit' => OpenStruct.new({"author_name"=>"Blair", "committer_name"=>"Geoff", "message"=>"Test Commit", "compare_url"=>"juice.me"}),"repository_id"=>891, "commit_id"=>2158938, "number"=>"7528", "pull_request"=>false, "config"=>{"script"=>"ci/travis.rb", "before_install"=>["gem install bundler"], "rvm"=>["1.9.3", "2.0.0"], "env"=>["GEM=railties", "GEM=ap,am,amo,as", "GEM=ar:mysql", "GEM=ar:mysql2", "GEM=ar:sqlite3", "GEM=ar:postgresql"], "notifications"=>{"email"=>false, "irc"=>{"on_success"=>"change", "on_failure"=>"always", "channels"=>["irc.freenode.org#rails-contrib"]}}, "bundler_args"=>"--path vendor/bundle --without test", ".result"=>"configured"}, "state"=>"failed", "started_at"=> '2013-05-19 19:18:52 UTC', "finished_at"=> '2013-05-19 19:44:11 UTC', "duration"=>8531})
    end

    it 'should create a test_build from a travis_api object' do 
      new_test_build = TestBuild.create_from(test_build, 1)
      expect(new_test_build.ci_source_id).to  eq 1
      expect(new_test_build.build_id).to      eq test_build.number.to_i
      expect(new_test_build.commit).to        eq test_build.commit_id
      expect(new_test_build.config).to        eq test_build.config[:rvm]
      expect(new_test_build.duration).to      eq test_build.duration
      expect(new_test_build.finished).to      eq DateTime.parse(test_build.finished_at)
      expect(new_test_build.state).to         eq test_build.state

      expect(new_test_build.compare).to       eq test_build.commit.compare_url
      expect(new_test_build.message).to       eq test_build.commit.message
      expect(new_test_build.author).to        eq test_build.commit.author_name
      expect(new_test_build.committer).to     eq test_build.commit.committer_name
    end
  end
end
