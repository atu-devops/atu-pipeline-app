require 'rails_helper'

RSpec.describe Park, type: :model do
  describe "validations" do
    it { is_expected.to validate_presence_of(:park_name) }
    it { is_expected.to validate_uniqueness_of(:park_name) }
    it { is_expected.to validate_presence_of(:description) }
    it { is_expected.to validate_presence_of(:capacity) }
    it { is_expected.to validate_presence_of(:availability) }
  end

  describe "associations" do
    it { is_expected.to have_many(:attractions).dependent(:destroy) }
    it { is_expected.to have_many(:bookings).dependent(:destroy) }
    it { is_expected.to have_many(:park_opening_hours).dependent(:destroy) }
    it { is_expected.to have_many(:ticket_types).dependent(:destroy) }
  end

  describe "factory" do
    it "is expected to have a valid factory" do
      pending "Add test for valid factory"
      expect(build(:park)).to be_valid
    end
  end
end
