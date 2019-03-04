# frozen_string_literal: true

class CreateDishes < ActiveRecord::Migration[5.2]
  def change
    create_table :dishes do |t|
      t.string :name
      t.integer :dish_type, null: false, default: 0
      t.integer :uom, null: false, default: 0
      t.integer :weight
      t.belongs_to :category, foreign_key: true

      t.timestamps
    end
  end
end
