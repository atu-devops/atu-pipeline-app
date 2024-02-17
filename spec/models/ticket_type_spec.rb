# spec/models/ticket_type_spec.rb
require 'rails_helper'

RSpec.describe TicketType, type: :model do
  describe "validations" do
    it { is_expected.to validate_presence_of(:type_name) }
    it { is_expected.to validate_presence_of(:description) }
  end

  describe "associations" do
    it { is_expected.to belong_to(:park) }
  end

end
