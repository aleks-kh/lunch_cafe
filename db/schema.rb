# frozen_string_literal: true

ActiveRecord::Schema.define(version: 20_190_228_142_815) do
  enable_extension 'plpgsql'

  create_table 'admins', force: :cascade do |t|
    t.string 'email', default: '', null: false
    t.string 'encrypted_password', default: '', null: false
    t.string 'reset_password_token'
    t.datetime 'reset_password_sent_at'
    t.datetime 'remember_created_at'
    t.datetime 'created_at', null: false
    t.datetime 'updated_at', null: false
    t.index ['email'], name: 'index_admins_on_email', unique: true
    t.index ['reset_password_token'], name: 'index_admins_on_reset_password_token', unique: true
  end

  create_table 'categories', force: :cascade do |t|
    t.string 'name'
    t.datetime 'created_at', null: false
    t.datetime 'updated_at', null: false
  end

  create_table 'day_menus', force: :cascade do |t|
    t.date 'menu_date'
    t.datetime 'created_at', null: false
    t.datetime 'updated_at', null: false
  end

  create_table 'dishes', force: :cascade do |t|
    t.string 'name'
    t.integer 'dish_type', default: 0, null: false
    t.integer 'uom', default: 0, null: false
    t.integer 'weight'
    t.bigint 'category_id'
    t.datetime 'created_at', null: false
    t.datetime 'updated_at', null: false
    t.index ['category_id'], name: 'index_dishes_on_category_id'
  end

  create_table 'menu_items', force: :cascade do |t|
    t.bigint 'day_menu_id'
    t.bigint 'dish_id'
    t.decimal 'price', precision: 6, scale: 2
    t.datetime 'created_at', null: false
    t.datetime 'updated_at', null: false
    t.index ['day_menu_id'], name: 'index_menu_items_on_day_menu_id'
    t.index ['dish_id'], name: 'index_menu_items_on_dish_id'
  end

  add_foreign_key 'dishes', 'categories'
  add_foreign_key 'menu_items', 'day_menus'
  add_foreign_key 'menu_items', 'dishes'
end
