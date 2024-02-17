require 'rails_helper'

RSpec.describe AdminUser, type: :model do
  context 'validations' do
    it { is_expected.to validate_presence_of(:email) }
    # it { is_expected.to validate_uniqueness_of(:email) }
    it 'validates the uniqueness of email' do
      pending 'add uniqueness validation'
      is_expected.to validate_uniqueness_of(:email)
    end
    it { is_expected.to validate_presence_of(:password) }
    it { is_expected.to validate_length_of(:password).is_at_least(6) }
  end

  describe '#ransackable_attributes' do
    it 'returns an array of searchable attributes' do

      expect(described_class.ransackable_attributes).to eq(%w[id email created_at updated_at])
    end
  end

  describe '#ransackable_associations' do
    it 'returns an empty array (no searchable associations defined)' do
      expect(described_class.ransackable_associations).to eq([])
    end
  end
end