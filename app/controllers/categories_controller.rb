# frozen_string_literal: true

class CategoriesController < ApplicationController
  before_action :authenticate_admin!
  before_action :set_category, only: %i[show edit update destroy]

  def index
    @categories = Category.all
  end

  def show; end

  def new
    @category = Category.new
  end

  def edit; end

  def create
    @category = Category.create(category_params)
    return redirect_to @category, notice: t('category.create') if @category.valid?

    flash[:alert] = @category.errors.full_messages.join(',')
    render :new
  end

  def update
    return redirect_to @category, notice: t('category.update') if @category.update(category_params)

    flash[:alert] = @category.errors.full_messages.join(',')
    render :edit
  end

  def destroy
    return redirect_to categories_path, notice: t('category.delete') if @category.destroy

    redirect_to categories_path, alert: t('errors.category_included')
  end

  private

  def set_category
    @category = Category.find(params[:id])
  end

  def category_params
    params.require(:category).permit(:name)
  end
end
