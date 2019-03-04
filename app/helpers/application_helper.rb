# frozen_string_literal: true

module ApplicationHelper
  def format_date(date)
    date.strftime('%B %d, %Y')
  end

  def categories
    Category.all.map { |category| [category.name, category.id] }
  end
end
