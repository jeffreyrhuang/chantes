FactoryGirl.define do
  factory :review do
    content 'Delicious food at an affordable price'
    rating 2
    association :user
    association :restaurant
  end
end
