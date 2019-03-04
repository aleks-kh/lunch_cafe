# frozen_string_literal: true

class MenuItemService
  def initialize(day_menu, params)
    @day_menu = day_menu
    @params = params
  end

  def call
    price_dish || dish
  end

  private

  def price_dish
    item = MenuItem.find_by(dish_id: @params[:id])
    @day_menu.menu_items.new(dish: item.dish, price: item.price) if item
  end

  def dish
    item = Dish.find_by(id: @params[:id])
    @day_menu.menu_items.new(dish: item) if item
  end
end
