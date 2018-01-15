FactoryBot.define do
  factory :menu do
    association :restaurant
    name "MyName"
  end
end
