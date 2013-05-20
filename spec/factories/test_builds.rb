# Read about factories at https://github.com/thoughtbot/factory_girl

FactoryGirl.define do
  factory :test_build do
    build_id 1
    state "MyString"
    finished "2013-05-19 13:57:10"
    duration 1
    message "MyString"
    config "MyString"
    commit "MyString"
    compare "MyString"
    author "MyString"
    committer "MyString"
    ci_source_id 1
  end
end
