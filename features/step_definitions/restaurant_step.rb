Given("the following restaurant exists") do |table|
  table.hashes.each do |hash|
    FactoryBot.create(:restaurant, hash)
  end
end

Given("I visit the {string} page") do |string|
  pending # Write code here that turns the phrase above into concrete actions
end

Then("I should see {string}") do |string|
  pending # Write code here that turns the phrase above into concrete actions
end