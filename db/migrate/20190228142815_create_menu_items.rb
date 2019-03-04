# frozen_string_literal: true

class CreateMenuItems < ActiveRecord::Migration[5.2]
  def change
    create_table :menu_items do |t|
      t.belongs_to :day_menu, foreign_key: true
      t.belongs_to :dish, foreign_key: true
      t.decimal :price, precision: 6, scale: 2

      t.timestamps
    end
  end
end
