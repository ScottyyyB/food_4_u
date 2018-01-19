Given("the map has been loaded") do
  sleep(5) until page.evaluate_script('$.active') == 0
  expect(page).to have_css '#map .gm-style'
end

Then("I should see {string} markers") do |string|
  pending # Write code here that turns the phrase above into concrete actions
end
