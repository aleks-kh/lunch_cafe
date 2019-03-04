# frozen_string_literal: true

class DayMenu < ApplicationRecord
  has_many :menu_items, dependent: :destroy

  validates :menu_date, presence: true
  validates :menu_date, uniqueness: { case_sensitive: false }

  scope :today_menu, -> { where('menu_date <= :start_date', start_date: Date.today).order('menu_date DESC') }
  scope :menu_date_asc, -> { order('menu_date ASC') }
end
