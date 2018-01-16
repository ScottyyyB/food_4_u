FactoryBot.define do
  factory :product do
    association :product_category
    name "MyString"
    price 1.50
  end
end
