FactoryGirl.define do
  factory :review do
    content Faker::Lorem.paragraph(3)
    rating Faker::Number.between(1, 5)
    association :user
    association :restaurant
    created_at Faker::Time.between(DateTime.now - 1, DateTime.now)
  end
end
