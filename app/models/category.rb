# frozen_string_literal: true

class Category < ApplicationRecord
  has_many :dishes, dependent: :restrict_with_error

  validates :name, presence: true
  validates :name, uniqueness: { case_sensitive: false }

  scope :menu_categories, ->(day_menu_id) { includes(dishes: :menu_item).where(menu_items: { day_menu_id: day_menu_id }).distinct }
end
