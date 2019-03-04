# frozen_string_literal: true

FactoryBot.define do
  factory :menu_item do
    day_menu { nil }
    dish { nil }
    price { '9.99' }
  end
end
