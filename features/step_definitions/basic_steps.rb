Then("I should see {string}") do |content|
  expect(page).to have_content content
end

def page_path_from(page_name)
  case page_name.downcase
    when 'landing' then root_path
  end
end
