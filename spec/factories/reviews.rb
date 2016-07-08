FactoryGirl.define do
  factory :review do
    :user
    :restaurant
    content Faker::Lorem.paragraph(3)
    rating Faker::Number.between(1, 5)
    created_at Faker::Time.between(DateTime.now - 1, DateTime.now)
  end
end
