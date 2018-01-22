require 'webmock/rspec'
WebMock.disable_net_connect!(allow_localhost: true)
require 'coveralls'
Coveralls.wear_merged!('rails')

RSpec.configure do |config|
  config.before(:each) do
    fixtures_path = "#{::Rails.root}/spec/fixtures"

    stockholm_3 = File.open("#{fixtures_path}/stockholm_3").read

    File.readlines("#{fixtures_path}/stockholm_urls.txt").map(&:chomp).each do |url|
      stub_request(:get, url)
          .with(headers: {
              'Accept' => '*/*',
              'Accept-Encoding' => 'gzip;q=1.0,deflate;q=0.6,identity;q=0.3',
              'User-Agent' => 'Ruby'
          })
          .to_return(status: 200, body: stockholm_3, headers: {})
    end
  end

  config.expect_with :rspec do |expectations|
    expectations.include_chain_clauses_in_custom_matcher_descriptions = true
  end

  config.mock_with :rspec do |mocks|
    mocks.verify_partial_doubles = true
  end

  config.shared_context_metadata_behavior = :apply_to_host_groups
end