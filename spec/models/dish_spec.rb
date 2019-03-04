# frozen_string_literal: true

RSpec.describe Dish, type: :model do
  context 'db columns' do
    it { is_expected.to have_db_column(:name).of_type(:string) }
    it { is_expected.to have_db_column(:dish_type).of_type(:integer) }
    it { is_expected.to have_db_column(:uom).of_type(:integer) }
    it { is_expected.to have_db_column(:weight).of_type(:integer) }
    it { is_expected.to have_db_column(:category_id).of_type(:integer) }
  end

  context 'relations' do
    let(:dish_types) { { by_weight: 0, in_portions: 1 } }
    let(:uoms) { { g: 0, L: 1, ml: 2, mg: 3, kg: 4, portion: 5 } }

    it { is_expected.to have_one(:menu_item).dependent(:restrict_with_error) }
    it { is_expected.to belong_to(:category) }
    it { is_expected.to define_enum_for(:dish_type).with(dish_types) }
    it { is_expected.to define_enum_for(:uom).with(uoms) }
  end

  context 'validations' do
    it { is_expected.to validate_presence_of(:name) }
    it { is_expected.to validate_uniqueness_of(:name).case_insensitive }
    it { is_expected.to validate_numericality_of(:weight).only_integer }
  end
end
