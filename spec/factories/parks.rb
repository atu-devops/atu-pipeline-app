# spec/factories/parks.rb
FactoryBot.define do
  factory :park do
    park_name { Faker::Lorem.word }
    description { Faker::Lorem.sentence }
    capacity { Faker::Number.between(from: 100, to: 1000) }
    availability { true }

    # Associations
    attractions { association(:attraction, park: instance) } # Uncomment if needed
    bookings { association(:booking, park: instance) } # Uncomment if needed
    park_opening_hours { association(:park_opening_hour, park: instance) } # Uncomment if needed
    ticket_types { association(:ticket_type, park: instance) } # Uncomment if needed
  end
end


