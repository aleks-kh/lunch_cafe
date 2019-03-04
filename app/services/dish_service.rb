# frozen_string_literal: true

class DishService
  def initialize(category)
    @category = category
  end

  def call
    @category ? dishes_category : Dish.all
  end

  private

  def dishes_category
    Dish.joins(:category).where(categories: { name: @category })
  end
end
