require 'rails_helper'

RSpec.describe Attraction, type: :model do
  describe "validations" do
    it "is expected to validate that :park cannot be empty/falsy" do
      is_expected.to validate_presence_of(:park_id)
    end

    it "validates the presence of age_limit" do
      is_expected.to validate_presence_of(:age_limit)
    end

    it "validates the presence of height_limit" do
      is_expected.to validate_presence_of(:height_limit)
    end
  end

end
