# spec/factories/attractions.rb
FactoryBot.define do
  factory :attraction do
    name { Faker::Lorem.word }
    description { Faker::Lorem.sentence }
    association :park # This will associate the attraction with a park automatically

    # Additional attributes
    age_limit { Faker::Number.between(from: 1, to: 18) }
    height_limit { Faker::Number.between(from: 100, to: 200) }
    availability { true }
  end
end
