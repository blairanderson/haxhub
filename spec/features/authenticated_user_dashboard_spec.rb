require 'spec_helper'

describe 'authenticated user / happy path' do
  it "user is not currently logged in" do
    visit "/"
    expect(page).to have_link("Sign in with Github")
  end
end
