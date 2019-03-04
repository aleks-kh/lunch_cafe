# frozen_string_literal: true

class Dish < ApplicationRecord
  belongs_to :category
  has_one :menu_item, dependent: :restrict_with_error
  enum dish_type: { by_weight: 0, in_portions: 1 }
  enum uom: { g: 0, L: 1, ml: 2, mg: 3, kg: 4, portion: 5 }

  validates :name, presence: true
  validates :weight, numericality: { only_integer: true, greater_than_or_equal_to: 0 }
  validates :name, uniqueness: { case_sensitive: false }
  validates :dish_type, presence: true, inclusion: { in: dish_types }
  validates :uom, presence: true, inclusion: { in: uoms }
  validate :validate_uom

  def validate_uom
    return errors.add(:uom, I18n.t('errors.in_portions')) if dish_type == 'in_portions' && uom != 'portion'

    errors.add(:uom, I18n.t('errors.by_weight')) if dish_type == 'by_weight' && uom == 'portion'
  end
end
