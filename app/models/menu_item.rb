# frozen_string_literal: true

class MenuItem < ApplicationRecord
  belongs_to :day_menu
  belongs_to :dish

  validates :price, numericality: { greater_than_or_equal_to: 0.01 }
end
