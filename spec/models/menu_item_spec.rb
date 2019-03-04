# frozen_string_literal: true

RSpec.describe MenuItem, type: :model do
  context 'db columns' do
    it { is_expected.to have_db_column(:day_menu_id).of_type(:integer) }
    it { is_expected.to have_db_column(:dish_id).of_type(:integer) }
    it { is_expected.to have_db_column(:price).of_type(:decimal).with_options(precision: 6, scale: 2) }
  end

  context 'relations' do
    it { is_expected.to belong_to(:day_menu) }
    it { is_expected.to belong_to(:dish) }
  end

  context 'validations' do
    it { is_expected.to validate_numericality_of(:price).is_greater_than_or_equal_to(0.01) }
  end
end
