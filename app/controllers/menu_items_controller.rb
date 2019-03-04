# frozen_string_literal: true

class MenuItemsController < ApplicationController
  before_action :authenticate_admin!
  before_action :set_menu_item, only: %i[show edit update destroy]
  before_action :set_day_menu, only: %i[index new create]

  def index
    @categories = Category.menu_categories(@day_menu.id)
  end

  def show; end

  def new
    return redirect_to day_menu_menu_items_path, alert: t('errors.dish_included') if @day_menu.menu_items.find_by(dish_id: params[:id])

    @menu_item = MenuItemService.new(@day_menu, params).call
  end

  def edit; end

  def create
    @menu_item = @day_menu.menu_items.create(menu_item_params)
    return redirect_to @menu_item, notice: t('menu_items.create') if @menu_item.valid?

    flash[:alert] = @menu_item.errors.full_messages.join(',')
    render :new
  end

  def update
    return redirect_to @menu_item, notice: t('menu_items.update') if @menu_item.update(menu_item_params)

    flash[:alert] = @menu_item.errors.full_messages.join(',')
    render :edit
  end

  def destroy
    @menu_item.destroy
    redirect_to day_menu_menu_items_path(@menu_item.day_menu), notice: t('menu_items.delete')
  end

  private

  def set_menu_item
    @menu_item = MenuItem.find(params[:id])
  end

  def set_day_menu
    @day_menu = DayMenu.find(params[:day_menu_id])
  end

  def menu_item_params
    params.require(:menu_item).permit(:price).tap do |whitelisted|
      whitelisted[:day_menu_id] = params[:day_menu_id]
      whitelisted[:dish_id] = params[:dish_id]
    end
  end
end
