# frozen_string_literal: true

class MenuController < ApplicationController
  before_action :set_menu, only: :show

  def show; end

  private

  def set_menu
    @today_menu = DayMenu.today_menu.first
    @menu = Category.menu_categories(@today_menu&.id)
  end
end
