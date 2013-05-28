require 'spec_helper'

describe Github::Service do
  describe ".prepare" do
    context "given in development env" do
      it "returns github_auth hash" do
        github_auth = Github::Service.prepare
        expect(github_auth.class).to be Hash
        expect(github_auth).to have_key :client_id
        expect(github_auth).to have_key :client_secret
      end 

      it "with github token, returns as oauth key" do
        github_auth = Github::Service.prepare({github_token: "token"})
        expect(github_auth).to have_key :oauth_token
        expect(github_auth[:oauth_token]).to eq "token"
      end
    end

    context "give in production env" do
      it "should also include a redirect URL" do
        # Find way to stub environments
      end
    end
  end
end
