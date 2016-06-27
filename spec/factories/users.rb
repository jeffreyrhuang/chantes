FactoryGirl.define do
  factory :user do
    email { Faker::Internet.email }
    password 'whatever'
  end
end