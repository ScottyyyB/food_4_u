Given("the following user exists") do |table|
  table.hashes.each do |user|
    create(:user, user)
  end
end
