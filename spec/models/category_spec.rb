# frozen_string_literal: true

RSpec.describe Category, type: :model do
  context 'db columns' do
    it { is_expected.to have_db_column(:name).of_type(:string) }
  end

  context 'relations' do
    it { is_expected.to have_many(:dishes).dependent(:restrict_with_error) }
  end

  context 'validations' do
    it { is_expected.to validate_presence_of(:name) }
  end
end
