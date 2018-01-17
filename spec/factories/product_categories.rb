FactoryBot.define do
  factory :product_category do
    association :menu
    name "MyString"
  end
end
