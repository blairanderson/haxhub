FactoryGirl.define do

  sequence :login do |n|
    "#{n}"
  end

  sequence :token do |n|
    "#{n}"
  end

  factory :user do
    full_name 'HaxHub_User'
    email   'haxhub_user@domain.com'
    login
    token
  end
end