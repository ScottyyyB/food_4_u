Given("I visit the {string} page") do |page_name|
  visit page_path_from(page_name)
end
