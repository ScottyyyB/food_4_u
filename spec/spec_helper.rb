require 'webmock/rspec'
WebMock.disable_net_connect!(allow_localhost: true)
require 'coveralls'
Coveralls.wear_merged!('rails')
RSpec.configure do |config|
  #fixtures_path = "#{::Rails.root}/features/support/fixtures"

  stockholm_3 = stub_request(:get, "https://maps.googleapis.com/maps/api/geocode/json?address=Hantverkargatan%2028,11220,Stockholm&key=AIzaSyCHgPt-pc3Mt8xSRhj94gV6Ge1X9zJpvzg&language=en&sensor=false")
  config.before(:each) do
    stub_request(:get, "https://maps.googleapis.com/maps/api/geocode/json?address=Hantverkargatan%2028,11220,Stockholm&key=AIzaSyCHgPt-pc3Mt8xSRhj94gV6Ge1X9zJpvzg&language=en&sensor=false").
        with(  headers: {
            'Accept'=>'*/*',
            'Accept-Encoding'=>'gzip;q=1.0,deflate;q=0.6,identity;q=0.3',
            'User-Agent'=>'Ruby'
        }).
        to_return(status: 200, body: stockholm_3, headers: {})
  end
  config.expect_with :rspec do |expectations|
    expectations.include_chain_clauses_in_custom_matcher_descriptions = true
  end

  config.mock_with :rspec do |mocks|
    mocks.verify_partial_doubles = true
  end

  config.shared_context_metadata_behavior = :apply_to_host_groups

end