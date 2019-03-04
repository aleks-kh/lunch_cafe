# frozen_string_literal: true

RSpec.describe DayMenu, type: :model do
  context 'db columns' do
    it { is_expected.to have_db_column(:menu_date).of_type(:date) }
  end

  context 'relations' do
    it { is_expected.to have_many(:menu_items).dependent(:destroy) }
  end

  context 'validations' do
    it { is_expected.to validate_presence_of(:menu_date) }
    it { is_expected.to validate_uniqueness_of(:menu_date).case_insensitive }
  end
end
