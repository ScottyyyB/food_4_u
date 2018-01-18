Given("the following user exists") do |table|
  table.hashes.each do |hash|
    FactoryBot.create(:user, hash)
  end
end
