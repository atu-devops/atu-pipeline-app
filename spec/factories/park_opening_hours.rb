# spec/factories/park_opening_hours.rb
FactoryBot.define do
  factory :park_opening_hour do
    day_of_week { Faker::Number.between(from: 0, to: 6) }
    opening_time { Faker::Time.between(from: DateTime.now - 1, to: DateTime.now) }
    closing_time { Faker::Time.between(from: DateTime.now, to: DateTime.now + 1) }
    start_month { Faker::Date.backward(days: 30) }
    end_month { Faker::Date.forward(days: 30) }
    park # This will associate the park opening hour with a park automatically
  end
end
