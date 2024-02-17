# spec/factories/ticket_types.rb
FactoryBot.define do
  factory :ticket_type do
    type_name { Faker::Lorem.word }
    description { Faker::Lorem.sentence }
    park
    category { Faker::Lorem.word }
    price { Faker::Commerce.price(range: 10.0..100.0) }
  end
end
