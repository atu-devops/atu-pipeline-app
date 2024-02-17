# spec/models/park_opening_hour_spec.rb
require 'rails_helper'

RSpec.describe ParkOpeningHour, type: :model do
  describe "associations" do
    it { is_expected.to belong_to(:park) }
  end

  describe "validations" do
    it { is_expected.to validate_presence_of(:day_of_week) }
    it { is_expected.to validate_presence_of(:opening_time) }
    it { is_expected.to validate_presence_of(:closing_time) }
    it { is_expected.to validate_presence_of(:start_month) }
    it { is_expected.to validate_presence_of(:end_month) }
  end

end
