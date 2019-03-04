# frozen_string_literal: true

Rails.application.routes.draw do
  root to: 'menu#show'
  devise_for :admins
  scope '/admin' do
    resources :dishes, :categories
    resources :day_menus, shallow: true do
      resources :menu_items, except: :new
    end
    match '/day_menus/:day_menu_id/dishes/:id/new', to: 'menu_items#new', via: :get, as: 'new_menu_item'
  end
end
