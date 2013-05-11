require 'spec_helper'

describe AuthenticationHelper do
  describe "#auth_message" do
    context "given there is a current_user" do
      it "returns logged in / log out? options" do
        # user = FactoryGirl.create(:user)
        # ApplicationController.stub(current_user: user)
        # expect(current_user).to eq nil
      end
    end

    context "given there is no current_user" do
      it "returns a 'sign in with github' message" do

      end
    end
  end
end
