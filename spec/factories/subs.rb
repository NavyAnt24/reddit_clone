# Read about factories at https://github.com/thoughtbot/factory_girl
require 'faker'

FactoryGirl.define do
  factory :moderator, class: User do
    sequence(:username) { |n| "user#{n}" }
    sequence(:email) { |n| "user#{n}@user#{n}.com"}
    password "password"
  end

  factory :sub do
    name Faker::Lorem.word
    moderator
  end
end
