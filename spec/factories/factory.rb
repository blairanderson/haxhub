FactoryGirl.define do

  sequence :login do |n|
    "unique_#{n}"
  end

  factory :user do
    full_name 'HaxHub_User'
    email   'haxhub_user@domain.com'
    login
  end
end