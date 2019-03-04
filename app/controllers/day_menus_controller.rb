# frozen_string_literal: true

class DayMenusController < ApplicationController
  before_action :authenticate_admin!
  before_action :set_day_menu, only: %i[show edit update destroy]

  def index
    @day_menus = DayMenu.menu_date_asc
  end

  def show; end

  def new
    @day_menu = DayMenu.new(menu_date: Date.today)
  end

  def edit; end

  def create
    @day_menu = DayMenu.create(day_menu_params)
    return redirect_to @day_menu, notice: t('day_menu.create') if @day_menu.valid?

    flash[:alert] = @day_menu.errors.full_messages.join(',')
    render :new
  end

  def update
    return redirect_to @day_menu, notice: t('day_menu.update') if @day_menu.update(day_menu_params)

    flash[:alert] = @day_menu.errors.full_messages.join(',')
    render :edit
  end

  def destroy
    @day_menu.destroy
    redirect_to day_menus_path, notice: t('day_menu.delete')
  end

  private

  def set_day_menu
    @day_menu = DayMenu.find(params[:id])
  end

  def day_menu_params
    params.require(:day_menu).permit(:menu_date)
  end
end
