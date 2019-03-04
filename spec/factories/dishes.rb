# frozen_string_literal: true

FactoryBot.define do
  factory :dish do
    name { 'MyString' }
    dish_type { 1 }
    category { nil }
    uom { 1 }
    weight { 1 }
  end
end
