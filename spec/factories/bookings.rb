# spec/factories/bookings.rb
FactoryBot.define do
  factory :booking do
    booking_datetime { Faker::Time.forward(days: 23, period: :evening) }
    user
    park
    ticket_type

    # Additional attributes if needed
    # booking_status_id { Faker::Number.between(from: 1, to: 5) }
  end
end
