Given("the following restaurants exists") do |table|
  table.hashes.each do |hash|
    FactoryBot.create(:restaurant, hash)
  end
end

Given("I visit the {string} page") do |restaurant|
  @restaurant = Restaurant.find_by(name: restaurant)
  visit restaurant_path(@restaurant)
end

Given("the following menus exist for {string}") do |restaurant, table|
  restaurant = Restaurant.find_by(name: restaurant)
  table.hashes.each do |hash|
    hash[:restaurant] = restaurant
    FactoryBot.create(:menu, hash)
  end
end

Given("the following product categories exist for {string}") do |menu, table|
  menu = Menu.find_by(name: menu)
  table.hashes.each do |hash|
    hash[:menu] = menu
    FactoryBot.create(:product_category, hash)
  end
end

Given("the following products exist for {string}") do |product_category, table|
  product_category = ProductCategory.find_by(name: product_category)
  table.hashes.each do |hash|
    hash[:product_category] = product_category
    FactoryBot.create(:product, hash)
  end
end

Given("the following reviews exist for user {string} and restaurant {string}") do |user, restaurant, table|
  user = User.find_by(email: user)
  restaurant = Restaurant.find_by(name: restaurant)
  table.hashes.each do |hash|
    hash[:user] = user
    hash[:restaurant] = restaurant
    review = FactoryBot.create(:review, hash)
  end
end

Then("show me the page") do
  save_and_open_page
end
