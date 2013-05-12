FactoryGirl.define do

  sequence :name do |n|
    "HaxHub #{n}"
  end

  sequence :url do |n|
    "http://www.github.com/blairand/haxhub_#{n}"
  end

  factory :repo do
    name
    owner "blairand"
    url
  end
end