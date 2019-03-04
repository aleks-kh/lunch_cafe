# frozen_string_literal: true

class DishesController < ApplicationController
  before_action :authenticate_admin!
  before_action :set_dish, only: %i[show edit update destroy]

  def index
    @dishes = DishService.new(params[:category]).call
  end

  def show; end

  def new
    @dish = Dish.new
  end

  def edit; end

  def create
    @dish = Dish.create(dish_params)
    return redirect_to @dish, notice: t('dish.create') if @dish.valid?

    flash[:alert] = @dish.errors.full_messages.join(',')
    render :new
  end

  def update
    return redirect_to @dish, notice: t('dish.update') if @dish.update(dish_params)

    flash[:alert] = @dish.errors.full_messages.join(',')
    render :edit
  end

  def destroy
    return redirect_to dishes_url, notice: t('dish.delete') if @dish.destroy

    redirect_to dishes_url, alert: t('errors.dish_delete')
  end

  private

  def set_dish
    @dish = Dish.find(params[:id])
  end

  def dish_params
    params.require(:dish).permit(:name, :dish_type, :weight, :uom, :category_id)
  end
end
