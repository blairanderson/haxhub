FactoryGirl.define do

  sequence :title do |n|
    "Project #{n}"
  end

  factory :project do
    title
  end
end