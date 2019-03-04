# frozen_string_literal: true

FactoryBot.define do
  factory :admin do
    sequence(:email) { |i| "admin#{i}@cafe.com" }
    password { FFaker::Internet.password }
  end
end
