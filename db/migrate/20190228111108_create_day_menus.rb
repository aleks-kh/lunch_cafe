# frozen_string_literal: true

class CreateDayMenus < ActiveRecord::Migration[5.2]
  def change
    create_table :day_menus do |t|
      t.date :menu_date

      t.timestamps
    end
  end
end
