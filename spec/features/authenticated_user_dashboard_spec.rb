require 'spec_helper'

describe 'authenticated user / happy path' do
  it "user is not currently logged in" do
    visit "/"
    expect(page).to have_link("login")
  end

  it 'should be able to login'

  it 'shold be able to add a new project after logging in'
end