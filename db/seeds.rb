# frozen_string_literal: true

['Салаты', 'Первые блюда', 'Гарниры', 'Горячие блюда', 'Соусы', 'Десерты'].each do |name|
  Category.create!(name: name)
end

Admin.create!(email: 'admin@cafe.com', password: '12345678')
