Then("I should see {string}") do |content|
  expect(page).to have_content content
end

When("I click {string}") do |element|
  click_link_or_button element
end

Then("I should be redirected to the {string} page") do |page_name|
  expect(page.current_path).to eq page_path_from(page_name)
end

Then("the {string} should be visible") do |selector|
  expect(page).to have_selector :css, "##{selector}"
end

When("I click on {string} link") do |link|
  click_link_or_button link
end

Then("I should be redirected to landing page") do
  expect(current_path).to eq root_path
end

def page_path_from(page_name)
  case page_name.downcase
    when 'thaitanic' then restaurant_path(Restaurant.find_by(name: page_name))
    when 'cart' then charges_path()
  end
end

Then("I should be on the {string} page") do |page|
  sleep(5)
  case page
    when 'cart'
      expect(current_path).to eq charges_path
  end
end

Then("I should not see {string}") do |content|
  expect(page).not_to have_content content
end
