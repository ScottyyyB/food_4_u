Given("I visit the cart page") do
  visit cart_path
end

When("I click {string} button") do |element|
  click_button element
  sleep (2)
  @stripe_iframe = all('iframe[name=stripe_checkout_app]').last
end

And("I fill in stripe form field {string} with {string}") do |field, value|
  sleep(2)
  @stripe_iframe = all('iframe[name=stripe_checkout_app]').last
  within_frame @stripe_iframe do
    fill_in field, with: value
  end
end

And("I submit the stripe form") do
  within_frame @stripe_iframe do
    find('.Section-button').click
    sleep(5)
  end
end
