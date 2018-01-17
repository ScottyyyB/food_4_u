seed_file = Rails.root.join('db', 'seeds', 'restaurants.yml')
config = YAML::load_file(seed_file)
Restaurant.create!(config) do |c|
  puts "Create restaurant with name: #{c.name}"
end

seed_file = Rails.root.join('db', 'seeds', 'menus.yml')
config = YAML::load_file(seed_file)
Restaurant.all.each do |restaurant|
  restaurant.menus.create!(config) do |c|
    puts "Create menu with name: #{c.name}"
  end
end

seed_file = Rails.root.join('db', 'seeds', 'product_categories.yml')
config = YAML::load_file(seed_file)
menus = Menu.all.select {|menu| menu.name == 'Lunch'}
menus.each do |menu|
  menu.product_categories.create!(config) do |c|
    puts "Create product category with name: #{c.name}"
  end
end

seed_file = Rails.root.join('db', 'seeds', 'products.yml')
config = YAML::load_file(seed_file)
categories = ProductCategory.all.select {|category| category.name == 'Pizza' }
categories.each do |category|
  category.products.create!(config) do |c|
    puts "Create product with name: #{c.name}"
  end
end
