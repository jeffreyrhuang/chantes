FactoryGirl.define do
  factory :restaurant do
    name Faker::Company.name
    address Faker::Address.street_address
    cuisine Faker::Lorem.word
    latitude Faker::Address.latitude
    longitude Faker::Address.longitude

  end
end