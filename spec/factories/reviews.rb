FactoryBot.define do
  factory :review do
    association :user
    association :restaurant
    body "MyText"
  end
end
