Given("the following restaurants exists") do |table|
  table.hashes.each do |hash|
    FactoryBot.create(:restaurant, hash)
  end
end

Given("I visit the {string} page") do |restaurant|
  @restaurant = Restaurant.find_by(name: restaurant)
  visit restaurant_path(@restaurant)
end

Then("I should see {string}") do |content|
  expect(page).to have_content content
end