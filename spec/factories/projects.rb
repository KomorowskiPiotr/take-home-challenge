# frozen_string_literal: true

FactoryBot.define do
  factory :project do
    name { Faker::Name.first_name }
    api_key { Faker::Internet.password }
  end
end
