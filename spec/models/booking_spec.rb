# spec/models/booking_spec.rb
require 'rails_helper'

RSpec.describe Booking, type: :model do
  describe "validations" do
    it { is_expected.to validate_presence_of(:booking_datetime) }
    it { is_expected.to validate_presence_of(:user_id) }
    it { is_expected.to validate_presence_of(:park_id) }
    it { is_expected.to validate_presence_of(:ticket_type_id) }
  end

  describe "associations" do
    it { is_expected.to belong_to(:park) }
    it { is_expected.to belong_to(:ticket_type) }
    it { is_expected.to belong_to(:user) }
  end

  describe "factory" do
    it "is expected to have a valid factory" do
      pending("Add test for factory")
      expect(build(:booking)).to be_valid
    end
  end
end
